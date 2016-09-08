//
//  AppDelegate.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/7/16.
//  Copyright © 2016 MC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appContainer: AppContainer?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FacebookAppLifeCycle.applicationDidFinishLaunchingWithOptions(application, options: launchOptions)
        self.appContainer = AppContainer()
        self.window = self.appContainer!.getWindow()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        FacebookAppLifeCycle.applicationDidBecomeActive()
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FacebookAppLifeCycle.application(application, openURL: url, sourceApplication: sourceApplication, annotation: application)
    }
}

