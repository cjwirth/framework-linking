//
//  AppDelegate.swift
//  example
//
//  Created by Caesar Wirth on 1/3/20.
//  Copyright © 2020 Caesar Wirth. All rights reserved.
//

import UIKit

import Framework1
import Framework2

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Both frameworks reference AppCenter, and we use one implementation from one framework,
        // and pass it into a class from the other framework to bring them together.
        //
        // This isn't _exactly_ how our actual use case is set up, but it seemed like a minimized
        // version of something quite similar to bring out the behavior I'm experiencing.
        let delegate = Framework2CrashDelegate.shared
        Framework1Manager.start(delegate: delegate)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

