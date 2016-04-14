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


Project 09 - ![RandomColorization](https://github.com/CoderYLiu/30DaysOfSwift/blob/master/Project%2008%20-%20RandomGradientColorMusic/RandomColorization.gif)

1）实现了背景渐变色的随机变换，顺带的背景音乐播放；

2）使用用 CAGradientLayer 来做背景的渐变色，渐变色分为两层，后一层决定了整个效果为什么颜色会变化的原因，前面一层是设定好了渐变色颜色、位置和startPoint endPoint；

3）后一层是实现原理就是随机变化纯色即可，对 RGB三色进行了赋值，比如 redValue = CGFloat(drand48())，这样整个背景颜色可以在256个颜色里随机变化；



## What's next? ##

Build a camera app.

## License ##

[30 Days Of Swift](https://github.com/CoderYLiu/30DaysOfSwift) is under the MIT license.

## Reach me ##

简书: [冰晨](http://www.jianshu.com/users/455a0339b2c3/latest_articles)

Weibo: [@程序猿冰晨](http://weibo.com/lycoder)

Facebook: [Sunny Liu](https://www.facebook.com/CoderYliu)

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/CoderYLiu/30daysOfswift/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
