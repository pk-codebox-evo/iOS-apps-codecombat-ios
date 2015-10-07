//
//  AppDelegate.swift
//  iPadClient
//
//  Created by Michael Schmatz on 7/26/14.
//  Copyright (c) 2014 CodeCombat. All rights reserved.
//

import UIKit
import HockeySDK

@UIApplicationMain
class AppDelegate: UIResponder {

	// MARK: - Properties

	lazy var window: UIWindow? = {
		let window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window.rootViewController = RootViewController()
		return window
	}()
}


extension AppDelegate: UIApplicationDelegate {
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {

		// Setup Hockey
		let hockey = BITHockeyManager.sharedHockeyManager()
		hockey.configureWithIdentifier("3428ced3f76216ff4074389af01a3ef7")
		hockey.startManager()
		hockey.authenticator.authenticateInstallation()

		// Initialize the IAP helper
		CodeCombatIAPHelper.sharedInstance

		// Display window
		window?.makeKeyAndVisible()

		return true
	}
}
