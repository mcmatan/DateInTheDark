//
//  MenuViewController.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, GuillotineMenu {
    //GuillotineMenu protocol
    var dismissButton: UIButton!
    var titleLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        
        dismissButton = UIButton(frame: CGRectZero)
        dismissButton.setImage(UIImage(named: "ic_menuRotated@3x"), forState: .Normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped(_:)), forControlEvents: .TouchUpInside)
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 1;
        titleLabel.text = "Pick Your Date"
        titleLabel.font = UIFont.boldSystemFontOfSize(17)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.sizeToFit()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dismissButtonTapped(sende: UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension MenuViewController: GuillotineAnimationDelegate {
    func animatorDidFinishPresentation(animator: GuillotineTransitionAnimation) {
    }
    func animatorDidFinishDismissal(animator: GuillotineTransitionAnimation) {
    }
    
    func animatorWillStartPresentation(animator: GuillotineTransitionAnimation) {
    }
    
    func animatorWillStartDismissal(animator: GuillotineTransitionAnimation) {
    }
}