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


Project 13 - ![AnimateTabel](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2013%20-%20AnimateTableViewCell/AnimateTabel.gif)


Project 14 - ![EmojiMachine](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2014%20-%20EmojiSlotMachine/EmojiMachine.gif)


Project 15 - ![AnimatedSplash](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2015%20-%20%20AnimatedSplash/AnimatedSplash.gif)


Project 16 - ![SlideMenu](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2016%20-%20SlideMenu/SlideMenu.gif)


Project 17 - ![TumblrMenu](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2017%20-%20TumblrMenu/TumblrMenu.gif)

## What's next? ##

Build a camera app.

## License ##

[30 Days Of Swift](https://github.com/CoderYLiu/30DaysOfSwift) is under the MIT license.

## Reach me ##

简书: [冰晨](http://www.jianshu.com/users/455a0339b2c3/latest_articles)

Weibo: [@程序猿冰晨](http://weibo.com/lycoder)

Facebook: [Sunny Liu](https://www.facebook.com/CoderYliu)

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/CoderYLiu/30daysOfswift/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
