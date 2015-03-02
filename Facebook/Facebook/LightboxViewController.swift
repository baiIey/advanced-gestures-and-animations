//
//  LightboxViewController.swift
//  Facebook
//
//  Created by Brian Bailey on 3/1/15.
//  Copyright (c) 2015 Nevver. All rights reserved.
//

import UIKit

class LightboxViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var doneButtonImage: UIImageView!
    @IBOutlet weak var imageActionsImage: UIImageView!
    @IBOutlet var bodyView: UIView!
    
    var photoDetail: UIImage!
    
    // store original position
    var imageOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set alpha to zero for all assets
        self.photoView.alpha = 1
        self.doneButtonImage.alpha = 1
        self.imageActionsImage.alpha = 1
        self.bodyView.alpha = 1
        
        photoView.image = photoDetail

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func imageDidPan(sender: UIPanGestureRecognizer) {
        // store how far we've panned
        var translation = sender.translationInView(view)
        var location = sender.locationInView(view)
    
        //  println("image panning")
        
        if(sender.state == UIGestureRecognizerState.Began){
            // started to pan
            imageOrigin = photoView.center
            // println("Pan started")
        } else if (sender.state == UIGestureRecognizerState.Changed) {
            // allows for panning on the y-axis only
           photoView.center = CGPoint(x: imageOrigin.x , y: imageOrigin.y + translation.y)
            
        } else if (sender.state == UIGestureRecognizerState.Ended){
            // ended pan
            // println("Pan ended")
            
            //upon release, move image back to initial position
            if (translation.y < 100 && translation.y > -100){
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.photoView.center = self.imageOrigin
                })
            }

        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
