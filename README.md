# Advanced Gestures and Animations (Facebook)
Tackling some more advanced features in gestures and animations that are used in modern iOS apps. Specifically, many of the more polished iOS apps often have custom transitions between view controllers as well as visual elements that move between view controllers.


#### Project requirements
* Tapping on a photo in the news feed should expand the photo full screen.
* Tapping the Done button should animate the photo back into its position in the news feed.
* On scroll of the full screen photo, the background should start to become transparent, revealing the feed.
* If the user scrolls a large amount and releases, the full screen photo should dismiss.
* Optional: The full screen photo should be zoomable.
* Optional: The user should be able to page through the other photos in full screen mode.


#### Notes
#####Setting iOS Status Bar Color

[CoderWall](https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift) has a straightforward guide for programatically setting the status bar color in iOS, app-wide.

Start by setting the boolean property of `view controller-based status bar`  in  `info.plist` to `No`. Then define the color of status bar in `didFinishLaunchingWithOptions` function in `AppDelegate.swift` as:

``UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
`

iOS 7.0 and newer constants include:

	UIStatusBarStyleLightContent
	A light status bar, intended for use on dark backgrounds.
	
	UIStatusBarStyleDefault
	A dark status bar, intended for use on light backgrounds.
	
	
#####Setting iOS Status Bar Color
Classmate Stacey Adams corrected an issue with calling controllers nested in tab controllers with by calling two additional variables, such that: 

`var tabViewController = fromViewController as UITabBarController
var feedNavViewController = tabViewController.viewControllers![0] as UINavigationController
var feedViewController = feedNavViewController.topViewController as FeedViewController
feedViewController.selectedImageView.hidden = true
var photoViewController = toViewController as PhotoViewController
photoViewController.photoDetail.hidden = true`

Which I adjusted for my code by calling my own custom view controllers:

`        var tabViewController = fromViewController as UITabBarController
        var feedNavViewController = tabViewController.viewControllers![0] as UINavigationController
        var feedViewController = feedNavViewController.topViewController as NewsFeedViewController
        feedViewController.selectedImageView.hidden = true
        var photoViewController = toViewController as LightboxViewController
        photoViewController.photoView.hidden = true`


#### Walkthrough of all user stories

![Video Walkthrough](facebook.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

UIApplication Class Reference, [UIStatusBarStyle](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIApplication_Class/#//apple_ref/c/tdef/UIStatusBarStyle).

Change status bar color guide from [CoderWall](https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift).