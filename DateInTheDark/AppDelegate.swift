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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FacebookAppLifeCycle.applicationDidFinishLaunchingWithOptions(application, options: launchOptions!)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        FacebookAppLifeCycle.applicationDidBecomeActive()
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FacebookAppLifeCycle.application(application, openURL: url, sourceApplication: sourceApplication, annotation: application)
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

