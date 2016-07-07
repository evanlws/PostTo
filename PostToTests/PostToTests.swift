//
//  PostToTests.swift
//  PostToTests
//
//  Created by Evan Lewis on 7/4/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import XCTest
@testable import PostTo

class PostToTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testCreateAccount() {
        let accountManager = AccountManager()
        var twitterAccounts = [Account]()
        accountManager.fetchTwitterAccounts { (accounts) in
            twitterAccounts = accounts
            XCTAssertEqual(twitterAccounts.count, 2)
        }
        
    }
    
}
