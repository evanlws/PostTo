//
//  AccountManager.swift
//  PostTo
//
//  Created by Evan Lewis on 7/4/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import Foundation
import Accounts

struct AccountManager {
    
    let persistencyManager = PersistencyManager()
    
    // Gets account objects based on AcAccount
    func requestTwitterAccountsFromACAccountStore(completion: (accounts: [Account]) -> Void) {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        var accounts = [Account]()
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted, error) in
            if granted {
                let acAccounts = accountStore.accountsWithAccountType(accountType)
                for acAccount in acAccounts {
                    let account = Account()
                    account.type = AccountType.Twitter.rawValue
                    account.username = acAccount.username
                    account.accountID = acAccount.identifier
                    accounts.append(account)
                }
            } else {
                assertionFailure("Permission not granted")
            }
            
            if (error != nil) {
                assertionFailure("ERROR with request: \(error)")
            }
            
            completion(accounts: accounts)
        }
    }
    
    func storeAccount(account: Account) {
        persistencyManager.storeAccount(account)
    }
    
    func fetchAccountWithID(accountID: String) -> Account? {
        return persistencyManager.fetchAccountWithID(accountID)
    }
}

