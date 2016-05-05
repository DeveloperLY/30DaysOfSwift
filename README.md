# 30 Days Of Swift
A self-taught project to learn Swift.


## Hi Community ##
虽然之前已经学习过Swift了, 但是一直没有什么机会实践, 现在又快忘得差不多了,所以坚持一个月, 打算追随前人的脚步，自己重写一遍30天学习Swift, 每天一个项目上传GitHub.


## Project Index & GIF Showcase ##

Project 01 - ![SimpleStopWatch](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2001%20-%20SimpleStopWatch/Simple%20Stop%20Watch.gif)

1）NSTimer 来做定时器：NSTimer.scheduledTimerWithTimeInterval；

2）开始、暂停以及重新计时三个功能；



Project 02 - ![Customfont](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2002%20-%20CustomFont/Customfont.gif)

1）[「造字工房」](http://makefont.com/font.html?MFZhiHei_Noncommercial_Regular)（目前授权个人免费非商业使用），这里分别用了造字工房劲黑，致黑和童心三种字体；

2）拖入字体文件.ttf 或 .otf 到工程中，配置 Info.plist - Fonts provided by application, 然后在 Build Phases - Copy Bundle Resources 里增加字体；



Project 03 - ![PlayLocalVideo](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2003%20-%20PlayLocalVideo/PlayLocalVideo.gif)

1）import AVKit 和 AVFondation，就可以使用系统的视频播放器了；

2）跟 Project 2里的字体一样，如果要build 在 iPhone 看到视频，那么也需要 Copy Bundle Resources添加下视频资源，这样就行了；

Project 04 - ![SnapChatMenu](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2004%20-%20SnapChatMenu/snapchatmenu.gif)

1) Snapchat 的三屏划动很经典，用到 UIScrollView 来实现三屏划动，定义了3个 ViewController；

2）左和右其实就是个Snapchat 界面截图ImageView，用来演示的，不要在意哈；



Project 05 - ![CarouselEffect](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2005%20-%20CarouselEffect/CarouselEffect.gif)

1) 照片横屏划动的旋转木马效果，用 UICollectionViewDataSource 来实现的，每一个卡片是一个 CollectionViewCell;

2）需要在 Collection View 里的 Scroll Direction 设置为水平滚动；

3）使用 Visual Effect View 来做模糊效果


Project 06 - ![FindMyLocation](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2006%20-%20FindMyLocation/FindMyLocation.gif)

1）先实现地理位置权限的获取，需要在 info.plist 里增加 NSLocationAlwaysUsageDescription （输入告知用户为什么要用地理位置权限的原因）和 NSLocationWhenInUseUsageDescription;

2）导入 CoreLocation Framework，使用 CLLocationManagerDelegate 里的CLPlacemark来获取城市、省份和国家，其实还需要 areasOfInterest，只是不知道为什么没有生效；



Project 07 - ![PullToRefresh](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2007%20-%20PullToRefresh/PullToRefresh.gif)

1）UIRefreshController 来实现下拉刷新，可以改背景色，菊花颜色，文字颜色和大小等；


Project 08 - ![RandomColorization](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2008%20-%20RandomGradientColorMusic/RandomColorization.gif)

1）实现了背景渐变色的随机变换，顺带的背景音乐播放；

2）使用用 CAGradientLayer 来做背景的渐变色，渐变色分为两层，后一层决定了整个效果为什么颜色会变化的原因，前面一层是设定好了渐变色颜色、位置和startPoint endPoint；

3）后一层是实现原理就是随机变化纯色即可，对 RGB三色进行了赋值，比如 redValue = CGFloat(drand48())，这样整个背景颜色可以在256个颜色里随机变化；


Project 09 - ![ImageScrollerEffect](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2009%20-ImageScroller/ImageScrollerEffect.gif)

1）放大缩小和水平垂直滚动查看图片大图，类似在 iMessage 里查看图片一样的效果；

2）先是套 UIImageView 到 UIScrollView 里，在 setZoomScaleFor(srollViewSize:CGSize)，最大缩放指为原图的3倍；

3）最后回到最初界面的中心，recenterImage()；

Project 10 - ![Video Background](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2010%20-%20VideoBackground/Videobg.gif)

1）一个酷炫的且不是很大的视频作为Splash 界面的背景元素，是足以让用户第一时间感受到这个应用的场景和价值，Spotify 就是个很好的例子，里面用到的素材也是来自 Spotify for iOS；

2）这次是用了一个自定义 VC: VideoSplashViewController，可以方便的使用到AVPlayerViewController里东西；

3）fillMode = .ResizeAspectFill，然后就是始终是 loop 的：alwaysRepeat=true；

4）记得视频文件始终要 copy 到 bundle resources 里去；


Project 11 - ![ClearTableViewCell](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2011%20-%20ClearTableViewCell/ClearTableViewCell.gif)

1）Clear App 的界面和交互非常的惊艳，已经惊艳了好几年了，所以这次想实现一下梯度渐变色的 TableView，当然不仅只是单色，还增加了cell 内的渐变色


Project 12 - ![LoginAnimation](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2012%20-%20LoginAnimation/LoginAnimation.gif)

1）一个登陆界面的过渡动画；


Project 13 - ![AnimateTabel](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2013%20-%20AnimateTableViewCell/AnimateTabel.gif)

1）TableViewController 之间的TableViewCell 过场动画，TableViewCell 的梯度渐变之间就采用了 Project-11 里的代码；

2）tableView 是有visibleCells的，这样可以先在载入前让 Cells不可见，然后到放到界面最底部然后向上载入上来；

3）这次是用 Spring 动画来实现如此「弹性」的效果：usingSpringWithDamping:0.8, initialSpringVelocity:0，其实也是非常基础的动画；


Project 14 - ![EmojiMachine](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2014%20-%20EmojiSlotMachine/EmojiMachine.gif)

1）今天主要是为了 Build for fun，用 UIPickerView 实现了 Emoji 老虎机小游戏；

2）arc4random( )做随机乱排Emoji，三行三列Emoji；

3）分享一个 MacOS 上快速输入 Emoji 的小技巧：按下 Control + Command + 空格键就可以了


Project 15 - ![AnimatedSplash](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2015%20-%20%20AnimatedSplash/AnimatedSplash.gif)

1）Twitter 的启动动画一直是个经典，小鸟 Logo 居中停留然后放大带出整个界面，是个令人愉悦的过程；

2）LaunchScreen.storyboard 设定好View 的蓝色背景和放入Twitter 小鸟的图，代码是写在AppDelegate 里的；


Project 16 - ![SlideMenu](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2016%20-%20SlideMenu/SlideMenu.gif)

1）特别没有使用三条杠的Hamburger icon，而是真用了一个汉堡 Emoji 🍔来做菜单图标:)

2）2个 VC，用 Segue 做转场，自建 MenuTransitionManagerDelegate 协议，在第一个 VC 里引入，moveDown 到 container!.frame.height -150 这个位置，选中Menu 后第二个 VC 就moveUp 到 -50 的位置；

3）增加 UITapGestureRecognizer，可以点击非 MenuTableViewCell 部分也可以 dismiss;


Project 17 - ![TumblrMenu](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2017%20-%20TumblrMenu/TumblrMenu.gif)

1）这个是 Tumblr 老版本iOS 内创建新 Post 的转场动画，新版本有了更炫的新动画；

2）跟 Project 16 一样也是2个 VC，1个 MenuTransitionManager 来实现的，看来这是实现 VC 之间转场动画（同时保留上一层 VC）的「标准方式」？

3）连了13个 IBOutlet 也是醉了，因为图标和文字都可以按 Delay 时间不同时候出现依次出现，在 MenuTransitionManager 引入 UIViewControllerTransitioningDelegate 来实现动画，包括背景模糊透明透出第一个 VC；

4）Menu 其实是分为三组，设定 topRowOffset middleRowOffset bottomRowOffset 分别为 CGFloat 300 150 50，所以在 transform 时 Text 和 Photo 为 self.offstage(-topRowOffset) 和 self.offstage(topRowOffset)依次对应，下面2组也是同理；


Project 18 - ![LimitCharacters](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2018%20-%20LimitCharacters/LimitCharacters.gif)

1）限定 UITextView 输入字符，跟 Twitter 微博一样做140字的限制，然后就无法再输得动了，一开始是 UITextField 尝试，发现不能换行，屁啊，赶紧换到 UITextView 来；

2）底部一行 UIView 在 viewDidLoad()里做了2个 NSNotificationCenter，通知随着键盘上升和 dismiss；

3）利用 UITextViewDelegate 里的shouldChangeTextInRange方法来实现输入字符的限制，如果 range.length >140就输入不可用，最右小角的实时字符倒数即使用 "\(140- myTextViewString.characters.count)"来实现；

4）UI Copy 自第三方 Twitter 客户端 Twitterrific；


Project 19 - ![PullRefresh](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2019%20-%20CustomPullToRefresh/PullRefresh.gif)

1）在 Project 7 时我做了下拉刷新和加载出数据，但是下拉刷新的样式还是系统的菊花样式，所以这次进行自定义下拉刷新的尝试，用单个文字变色旋转和放大的简单动画；

2）新建RefreshContents.xib 专门来放刷新用的12个 UILabels，不用连接到 ViewController，用 viewWithTag()来指定；

3）刷新动画分为两步，所以建了2步的方法，animateRefreshStep1() 和 animateRefreshStep2()，第一步是旋转 CGAffineTransformMakeRotation(CGFloat(M_PI_4)) 和 textColor 变随机色 self.getNextColor() （这个是新建的随机色方法），第二步就更为简单了就是做放大动画，全部 Scale 到 CGAffineTransformMakeScale(1.5,1.5)；

4）因为没有真实数据的关系，这个小试验是用 NSTimer.scheduledTimerWithTimeInterval 来稳定5秒做的效果，真实项目里肯定是不用这个的；


Project 20 - ![CollectionViewAnimation](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2020%20-%20CollectionViewAnimation/CollectionViewAnimation.gif)

1）啊啊啊啊，这个效果其实挺烂的，但是 UICollectionView 的平滑转场我们应该经常看到，特别是 List 和 Details 之间，比如商品列表和商品详情，新闻列表和新闻全文；

2）这其实是一个 VC，详情界面里只是多了个返回icon，在 func collectionView didSelectItemAtIndexPath 里点击后执行转场动画，把 Cell 带到最前层次 cell?.superview?.bringSubviewToFront(cell!) ，然后 cell?.frame= collectionView.bounds 就可以变大到全屏，通过这个示例也帮助了我理解了 frame 和 bounds 的区别；

3）在 func backButtonDidTouch() 里记得要让 CollectionView reloadItemsAtIndexPaths 一下；



Project 21 - ![SwipeableCell](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2021%20-%20SwipeableCell/SwipeableCell.gif)

## What's next? ##

Build a camera app.

## License ##

[30 Days Of Swift](https://github.com/CoderYLiu/30DaysOfSwift) is under the MIT license.

## Reach me ##

简书: [冰晨](http://www.jianshu.com/users/455a0339b2c3/latest_articles)

Weibo: [@程序猿冰晨](http://weibo.com/lycoder)

Facebook: [Sunny Liu](https://www.facebook.com/CoderYliu)

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/CoderYLiu/30daysOfswift/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
