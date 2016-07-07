//
//  ViewController.swift
//  PostTo
//
//  Created by Evan Lewis on 7/4/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import UIKit
import Accounts

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch Twitter Accounts
        let accountManager = AccountManager()
        accountManager.fetchTwitterAccounts { (accounts) in
            let accountActionSheet = UIAlertController(title: nil, message: "Select an Account", preferredStyle: .ActionSheet)
            
            for account in accounts {
                let accountSelection = UIAlertAction(title: account.username, style: .Default, handler: { (alert: UIAlertAction!) -> Void in
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

