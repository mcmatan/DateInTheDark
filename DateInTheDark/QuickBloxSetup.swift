//
//  QuickBloxSetup.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 9/8/16.
//  Copyright © 2016 MC. All rights reserved.
//

import Foundation
import Quickblox

class QuickBloxSetup {
    static func setup() {
        QBSettings.setApplicationID(92)
        QBSettings.setAuthKey("wJHdOcQSxXQGWx5")
        QBSettings.setAuthSecret("BTFsj7Rtt27DAmT")
        QBSettings.setAccountKey("7yvNe17TnjNUqDoPwfqp")
    }
}