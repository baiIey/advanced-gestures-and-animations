//
//  ImageTransition.swift
//  Facebook
//
//  Created by Brian Bailey on 3/1/15.
//  Copyright (c) 2015 Nevver. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var newsFeedViewController = fromViewController as NewsFeedViewController
        newsFeedViewController.selectedImageView.hidden = true
        
        var photoViewController = toViewController as LightboxViewController
        photoViewController.photoView.hidden = true
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
}