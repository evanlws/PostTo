//
//  AppDelegate.swift
//  PostTo
//
//  Created by Evan Lewis on 7/4/16.
//  Copyright © 2016 Evan Lewis. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Crashlytics.self])
        return true
    }

}
