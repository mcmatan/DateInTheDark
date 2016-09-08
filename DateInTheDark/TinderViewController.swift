//
//  TinterViewController.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import UIKit
import Koloda

class TinderViewController: UIViewController {
    let manuController: UIViewController
    private lazy var presentationAnimator = GuillotineTransitionAnimation()
    
    init(menuController: UIViewController) {
        self.manuController = menuController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let navBar = self.navigationController!.navigationBar
        navBar.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_menuRotated@3x"), forState: UIControlState.Normal)
        btn.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        btn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btn.addTarget(self, action: #selector(TinderViewController.showMenu(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        let barButton = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = barButton
        self.navigationItem.title = "Pick Your Date"
    }
    
    func showMenu(sender: UIButton) {
        let menuVC = self.manuController
        menuVC.modalPresentationStyle = .Custom
        menuVC.transitioningDelegate = self
        if menuVC is GuillotineAnimationDelegate {
            presentationAnimator.animationDelegate = menuVC as? GuillotineAnimationDelegate
        }
        presentationAnimator.supportView = self.navigationController?.navigationBar
        presentationAnimator.presentButton = sender as UIView
        presentationAnimator.duration = 0.25
        self.presentViewController(menuVC, animated: true, completion: nil)
    }
}

extension TinderViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentationAnimator.mode = .Presentation
        return presentationAnimator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentationAnimator.mode = .Dismissal
        return presentationAnimator
    }
}
