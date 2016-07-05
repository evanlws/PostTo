//
//  Account.swift
//  PostTo
//
//  Created by Evan Lewis on 7/4/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import Foundation
import RealmSwift

enum AccountType: Int8 {
    case Facebook = 0, Twitter
}

class Account: Object {
    
    dynamic var name: String = ""
    dynamic var type: Int8 = 0
    dynamic var associatedObject: Object?

}
