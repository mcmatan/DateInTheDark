//
//  MenuViewModel.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 17/09/2016.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation

protocol MenuViewModelType {
    func logout()
}

class MenuViewModel: MenuViewModelType {
    var loginService: LoginServiceType
    init(loginService: LoginServiceType) {
        self.loginService = loginService
    }
    
    func logout() {
        self.loginService.logout()
    }
}