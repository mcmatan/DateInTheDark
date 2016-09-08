//
//  LogInViewController.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/7/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit
import SnapKit

class LogInViewController: UIViewController {
    let btnFacebook = FBSDKLoginButton()
    let viewModel: LogInViewModelType
    
    init(viewModel: LogInViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(btnFacebook)
        self.btnFacebook.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        self.btnFacebook.delegate = self.viewModel
    }
}