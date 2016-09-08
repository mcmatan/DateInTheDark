//
//  MenuViewController.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.greenColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}