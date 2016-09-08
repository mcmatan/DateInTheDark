//
//  KeyChain.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation

let KeyFacebookAccessToken = "KeyFacebookAccessToken"

protocol KeyChainType {
    func saveFacebookAccessToken(facebookAccessToken token: String)
    func getFacebookAccessToken()->String? 
}

class KeyChain: KeyChainType {
    func saveFacebookAccessToken(facebookAccessToken token: String) {
        NSUserDefaults.standardUserDefaults().setObject(token, forKey: KeyFacebookAccessToken)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    func getFacebookAccessToken()->String? {
        return NSUserDefaults.standardUserDefaults().objectForKey(KeyFacebookAccessToken) as? String
    }
}