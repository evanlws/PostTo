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
    
    func fetchTwitterAccounts(completion: (accounts: [Account]) -> Void) {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        var accounts = [Account]()
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted, error) in
            if granted {
                let acAccounts = accountStore.accountsWithAccountType(accountType)
                for acAccount in acAccounts {
                    let account = Account()
                    account.username = acAccount.username
                    account.type = AccountType.Twitter.rawValue
                    account.accountID = acAccount.identifier
                    accounts.append(account)
                }
            }
            completion(accounts: accounts)
        }
    }
}

