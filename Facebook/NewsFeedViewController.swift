//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Brian Bailey on 2/23/15.
//  Copyright (c) 2015 Nevver. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedView: UIImageView!
    
    var selectedImageView: UIImageView!
    var fadeTransition: FadeTransition!
    
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedView.image!.size // set content size for scrollview

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("I'm preparing for segue")
        
        var destinationViewController = segue.destinationViewController as LightboxViewController
        
        destinationViewController.photoDetail = selectedImageView.image
        
//        fadeTransition = FadeTransition()
//        fadeTransition.duration = 3
        
        imageTransition = ImageTransition()
        imageTransition.duration = 0.5
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = imageTransition
        
    }

}
