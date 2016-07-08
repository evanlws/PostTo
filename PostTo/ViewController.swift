//
//  ViewController.swift
//  PostTo
//
//  Created by Evan Lewis on 7/4/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import UIKit
import Accounts
import Realm

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectTwitterAccounts()
    }
    
    private func selectTwitterAccounts() {
        let accountManager = AccountManager()
        accountManager.requestTwitterAccountsFromACAccountStore { (accounts) in
            let accountActionSheet = UIAlertController(title: nil, message: "Add an account to PostTo", preferredStyle: .ActionSheet)
            
            for account in accounts {
                // Once an account is selected, add it to the list of users' accounts
                let accountSelection = UIAlertAction(title: account.username, style: .Default, handler: { (alert: UIAlertAction!) -> Void in
                    accountManager.storeAccount(account)
                    print("Selected \(account.username)")
                    
                })
                accountActionSheet.addAction(accountSelection)
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(accountActionSheet, animated: true, completion: nil)
            }
        }
    }
}

