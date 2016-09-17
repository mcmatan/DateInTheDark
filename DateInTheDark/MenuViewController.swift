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
    let menuViewModel: MenuViewModelType
    let btnLogout = UIButton()
    
    init(menuViewModel: MenuViewModelType) {
        self.menuViewModel = menuViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        self.view.addSubview(self.btnLogout)
        self.btnLogout.snp_makeConstraints { (make) in
            make.center.equalTo(self.view.snp_center)
        }
        self.btnLogout.setTitle("Logout", forState: UIControlState.Normal)
        self.btnLogout.addTarget(self, action: #selector(MenuViewController.logoutBtnPress), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func logoutBtnPress() {
        self.menuViewModel.logout()
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