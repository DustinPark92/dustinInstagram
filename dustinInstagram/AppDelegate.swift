//
//  AppDelegate.swift
//  dustinInstagram
//
//  Created by Dustin on 2020/08/04.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let praseConfig = ParseClientConfiguration { (ParseMutableClientConfiguration) in
            
            ParseMutableClientConfiguration.applicationId = "dustinInstagram"
            ParseMutableClientConfiguration.clientKey = "dustinInstagramKey"
            ParseMutableClientConfiguration.server = "http://dustininstagram.herokuapp.com/parse"
        }
        
        Parse.initialize(with: praseConfig)
        
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

