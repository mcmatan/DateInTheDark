//
//  RootViewModel.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import RxSwift

protocol RootViewModelType {
    var showLogin: BehaviorSubject<Bool> {get}
}

class RootViewModel: RootViewModelType {
    let showLogin = BehaviorSubject<Bool>(value: true)
}