//
//  FacebookAppLifeCycle.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class FacebookAppLifeCycle {
    
    static func applicationDidBecomeActive() {
        FBSDKAppEvents.activateApp()
    }
    
    static func applicationDidFinishLaunchingWithOptions(application: UIApplication ,options: [NSObject: AnyObject]?) {
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: options)
    }
    
    static func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
}