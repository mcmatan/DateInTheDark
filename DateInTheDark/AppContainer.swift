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
                c.register(RootViewController.self) { r in
                let controller = RootViewController()
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
    
    func getRooViewController()->UIViewController? {
        return self.container?.resolve(RootViewController.self)
    }
    
    func getWindow()->UIWindow {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = self.getRooViewController()
        window.makeKeyWindow()
        return window
    }
}