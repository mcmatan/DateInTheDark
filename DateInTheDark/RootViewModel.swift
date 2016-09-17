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
    private let loginService: LoginServiceType
    var logedInListener: Listener!
    var logedOutListener: Listener!
    
    init(loginService: LoginServiceType) {
        self.loginService = loginService
        self.subscribeForEvents()
        self.checkIfLoggedIn()
    }
    
    func checkIfLoggedIn() {
        self.loginService.isLoggedIn { (isLoggenIn) in
            self.showLogin.onNext(!isLoggenIn)
        }
    }
    
    func subscribeForEvents() {
        self.logedInListener = Events.userLoggedIn.on { (void) in
            self.showLogin.onNext(false)
        }
        self.logedOutListener = Events.logout.on { (void) in
            self.showLogin.onNext(true)
        }
    }
}