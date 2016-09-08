//
//  Container.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import Swinject
import UIKit


class AppContainer {
    var container: Container?
 
    func setup() {
        self.container = Container() { c in
            
            
            //MARK: Model
            
            c.register(KeyChainType.self) { r in
                let keyChain = KeyChain()
                return keyChain
            }
            
            c.register(LoginServiceType.self) { r in
                let model = LoginService(keyChain: r.resolve(KeyChainType.self)!)
                return model
            }
            
            //MARK: ViewModels
            
            c.register(RootViewModelType.self) { r in
                let viewModel = RootViewModel(loginService: r.resolve(LoginServiceType.self)!)
                return viewModel
            }
            
            c.register(LogInViewModelType.self) { r in
                let viewModel = LogInViewModel(loginService: r.resolve(LoginServiceType.self)!)
                return viewModel
            }
            
            //MARK: Controllers
            
            c.register(LogInViewController.self) { r in
                let viewModel = r.resolve(LogInViewModelType.self)
                let controller = LogInViewController(viewModel: viewModel!)
                return controller
            }
            
            c.register(MainNavigationController.self) { r in
                let controller = MainNavigationController()
                return controller
            }
            
            c.register(RootViewController.self) { r in
            let mainNavigationController = r.resolve(MainNavigationController.self)
            let loginViewController = r.resolve(LogInViewController.self)
            let viewModel = r.resolve(RootViewModelType.self)
                let controller = RootViewController(loginViewController!, mainNavigationController: mainNavigationController!, viewModel: viewModel!)
                return controller
            }
        }
    }
    
    func getRootViewController()->UIViewController? {
        if let isRootViewController = self.container?.resolve(RootViewController.self) {
            return isRootViewController
        }
        printDebug("No root view controller was found")
        return nil
    }
    
    func getWindow()->UIWindow {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = self.getRootViewController()
        window.makeKeyAndVisible()
        return window
    }
}