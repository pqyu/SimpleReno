//
//  AppDelegate.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
final class AppDelegate: UIResponder {
    var window: UIWindow?
    static let parseApplicationID = "KdGvFfI2XPG3iLlF0CpLzOIWnPwlCXKxR1Zrgk8l"
    static let parseClientKey = "t2CqkeGBKlypk7IU7RRXVUVftXZnaXt0ycn4Nbg8"
}

//MARK: UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.setApplicationId(AppDelegate.parseApplicationID, clientKey: AppDelegate.parseClientKey)
        return true
    }
}

//MARK: Private helper methods
private extension AppDelegate {
    
}