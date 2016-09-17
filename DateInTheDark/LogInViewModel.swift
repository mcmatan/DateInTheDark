//
//  LogInViewModel.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import UIKit

protocol LogInViewModelType: FBSDKLoginButtonDelegate {
    
}

class LogInViewModel: NSObject, LogInViewModelType {
    let loginService: LoginServiceType
    
    init(loginService: LoginServiceType) {
        self.loginService = loginService
    }
    
    //MARK: Quickblox
    
    func loginQuickblox(with facebookAccessToken: String) {
        self.loginService.login(with: facebookAccessToken) { (success) in
            if success == true {
                Events.userLoggedIn.emit()
            }
        }
    }
    
    //MARK: Facebook button delegate
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        printDebug("didCompleteWithResult Facebook login")
        if ((error) != nil) {
            printDebug("Error login in with facebook")
        }
        else if result.isCancelled {
            printDebug("Canceled login in with facebook")
        }
        else {
            printDebug("Success login in with facebook")
            self.loginService.didFacebookLogin(result)
            self.loginQuickblox(with: result.token.tokenString)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        printDebug("loginButtonDidLogOut")
    }
}