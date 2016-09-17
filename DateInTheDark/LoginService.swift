//
//  LoginService.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import Quickblox
import FBSDKLoginKit

protocol LoginServiceType {
    func login(with facebookAccessToken: String, completion:(success: Bool)->Void)
    func isLoggedIn(isLoggedInCompletion:(isLoggenIn: Bool)->Void)
    func logout()
    func didFacebookLogin(results: FBSDKLoginManagerLoginResult)
}

class LoginService: LoginServiceType {
    let keyChain: KeyChainType
    
    init(keyChain: KeyChainType) {
        self.keyChain = keyChain
    }
    
    func login(with facebookAccessToken: String, completion:(success: Bool)->Void) {
        self.keyChain.saveFacebookAccessToken(facebookAccessToken: facebookAccessToken)
        QBRequest.logInWithSocialProvider("facebook", accessToken: facebookAccessToken, accessTokenSecret: nil, successBlock: { (response, user) in
            completion(success: true)
        }) { (errorResponse) in
            completion(success: false)
        }
    }
    
    func didFacebookLogin(results: FBSDKLoginManagerLoginResult) {
        if results.grantedPermissions.contains("public_profile") {
            if (FBSDKAccessToken.currentAccessToken() != nil) {
                let params = ["fields": "name,email,picture.type(large)"]
                FBSDKGraphRequest(graphPath: "me", parameters: params as [NSObject : AnyObject]).startWithCompletionHandler({ (connection, result, error) in
                    if let _ = error {
                        return
                    }

//                    print("Fetched user = \(results)")
//                    let name = results.valueForKey("name")
//                    let picturesArr = results.valueForKey("picture")
//                    let dataArr = picturesArr!.valueForKey("data")
//                    let profilePic = dataArr!.valueForKey("url")
//                    
//                    print(profilePic)
              
                })
            }
        }
    }
    
    func isLoggedIn(isLoggedInCompletion:(isLoggenIn: Bool)->Void) {
        if let isToken = self.keyChain.getFacebookAccessToken() {
            self.login(with: isToken, completion: { (success) in
                isLoggedInCompletion(isLoggenIn: success)
            })
        } else {
            isLoggedInCompletion(isLoggenIn: false)
        }
    }
    
    func logout() {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut() 
        self.keyChain.cleanAll()
        Events.logout.emit()
    }
}