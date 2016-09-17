//
//  UserDefaultExtentions.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 17/09/2016.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation

extension NSUserDefaults {
    static func deleteAllKeysAndValue() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let dic = userDefaults.dictionaryRepresentation()
        for key in dic.keys {
            userDefaults.removeObjectForKey(key)
        }
        userDefaults.synchronize()
    }
}