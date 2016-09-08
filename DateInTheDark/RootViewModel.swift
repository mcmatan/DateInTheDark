//
//  RootViewModel.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import RxSwift
import EmitterKit

protocol RootViewModelType {
    var showLogin: BehaviorSubject<Bool> {get}
}

class RootViewModel: RootViewModelType {
    let showLogin = BehaviorSubject<Bool>(value: true)
    
    init() {
        subscribeForEvents()
    }
    
    func subscribeForEvents() {
        
        Events.userLoggedIn.once { (void) in
            self.showLogin.onNext(false)
        }
    }
}