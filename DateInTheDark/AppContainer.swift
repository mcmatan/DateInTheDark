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
            
            //MARK: ViewModels
            
            c.register(RootViewModelType.self) { r in
                let viewModel = RootViewModel()
                return viewModel
            }
            
            //MARK: Controllers
            
            c.register(LogInViewController.self) { r in
                let controller = LogInViewController()
                return controller
            }
            
            c.register(ApplicationViewController.self) { r in
                let controller = ApplicationViewController()
                return controller
            }
            
            c.register(RootViewController.self) { r in
            let applicationViewController = r.resolve(ApplicationViewController.self)
            let loginViewController = r.resolve(LogInViewController.self)
            let viewModel = r.resolve(RootViewModelType.self)
                let controller = RootViewController(loginViewController!, maimApplicationViewController: applicationViewController!, viewModel: viewModel!)
                return controller
            }
//            c.register(AnimalType.self) { _ in Cat(name: "Mimi") }
//            c.register(PersonType.self) { r in
//                PetOwner(pet: r.resolve(AnimalType.self)!)
//            }
//            c.register(PersonViewController.self) { r in
//                let controller = PersonViewController()
//                controller.person = r.resolve(PersonType.self)
//                return controller
//            }
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