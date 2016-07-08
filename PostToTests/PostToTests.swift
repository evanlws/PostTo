//
//  PostToTests.swift
//  PostToTests
//
//  Created by Evan Lewis on 7/4/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import XCTest
import Accounts
@testable import PostTo

class PostToTests: XCTestCase {
    
    var accountManager = AccountManager()
    var accounts = [Account]()
    
    override func setUp() {
        super.setUp()
        accountManager = AccountManager()
    }
    
    func test_A_FetchTwitterAccounts() {
        accountManager.requestTwitterAccountsFromACAccountStore { (accounts) in
            self.accounts = accounts
            XCTAssertEqual(self.accounts.count, 2)
        }
        
    }
    
    func test_C_StoreAccounts() {
        for account in accounts {
            accountManager.storeAccount(account)
            XCTAssert(accountManager.fetchAccountWithID(account.accountID) != nil)
        }
    }
    
}
