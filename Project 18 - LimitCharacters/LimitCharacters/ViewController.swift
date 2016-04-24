//
//  ViewController.swift
//  LimitCharacters <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/24.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var bottomUIView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.delegate = self
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        
        tweetTextView.backgroundColor = UIColor.clearColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        let myTextViewString = tweetTextView.text
        characterCountLabel.text = "\(140 - myTextViewString.characters.count)"
        
        if range.length > 140{
            return false
        }
        
        let newLength = (myTextViewString?.characters.count)! + range.length
        
        return newLength < 140
        
        
        
    }
    
    func keyBoardWillShow(note:NSNotification) {
        
        let userInfo  = note.userInfo
        let keyBoardBounds = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height
        let animations:(() -> Void) = {
            
            self.bottomUIView.transform = CGAffineTransformMakeTranslation(0,-deltaY)
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0, options:options, animations: animations, completion: nil)
            
        }else {
            
            animations()
        }
        
    }
    
    
    func keyBoardWillHide(note:NSNotification) {
        
        let userInfo  = note.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations:(() -> Void) = {
            
            self.bottomUIView.transform = CGAffineTransformIdentity
            
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0, options:options, animations: animations, completion: nil)
            
        }else{
            
            animations()
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }


}

