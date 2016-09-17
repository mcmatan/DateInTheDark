//
//  FirebaseWrapper.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 17/09/2016.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import Firebase

protocol DataBaseType {
    
}

class DataBase: DataBaseType {
    
    init() {
        FIRApp.configure()
        let ref =  FIRDatabase.database().reference()
    }
}