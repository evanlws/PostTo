//
//  PersistencyManager.swift
//  PostTo
//
//  Created by Evan Lewis on 7/8/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class PersistencyManager {

    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func storeAccount(account: Account) {
        try! realm.write({ 
            realm.add(account)
        })
    }

    func fetchAccountWithID(accountID: String) -> Account? {
        let accounts = realm.objects(Account.self).filter("accountID == \(accountID)")
        if let account = accounts.first {
            return account
        }
        return nil
    }
    
}
