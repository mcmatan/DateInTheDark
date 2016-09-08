//
//  LoginService.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import Quickblox

protocol LoginServiceType {
    func login(with facebookAccessToken: String, completion:(success: Bool)->Void)
    func isLoggedIn(isLoggedInCompletion:(isLoggenIn: Bool)->Void) 
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
    
    func isLoggedIn(isLoggedInCompletion:(isLoggenIn: Bool)->Void) {
        if let isToken = self.keyChain.getFacebookAccessToken() {
            self.login(with: isToken, completion: { (success) in
                isLoggedInCompletion(isLoggenIn: success)
            })
        } else {
            isLoggedInCompletion(isLoggenIn: false)
        }
    }
}