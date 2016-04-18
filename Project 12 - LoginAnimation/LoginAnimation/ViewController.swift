//
//  ViewController.swift
//  LoginAnimation <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/18.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlignUsername.constant -= view.bounds.width
        centerAlignPassword.constant -= view.bounds.width
        loginButton.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.00, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.10, options: .CurveEaseOut, animations: {
            
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.20, options: .CurveEaseOut, animations: {
            
            self.loginButton.alpha = 1
            
            }, completion: nil)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    @IBAction func backButtonDidClick(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func loginButtonDidClick(sender: UIButton) {
        let bounds = self.loginButton.bounds
        
        // Animate
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.enabled = false
            
            }, completion: { finished in self.loginButton.enabled = true })
    }

}

