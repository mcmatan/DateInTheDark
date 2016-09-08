//
//  RootViewController.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import UIKit

class RootViewController :UIViewController {
    let loginViewController: UIViewController
    let maimApplicationViewController: UIViewController
    
    init(_ loginViewController: UIViewController, maimApplicationViewController: UIViewController) {
        self.loginViewController = loginViewController
        self.maimApplicationViewController = maimApplicationViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}