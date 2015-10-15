//
//  AppDelegate.swift
//  Drivecast
//
//  Created by Marc Rollin on 10/15/15.
//  Copyright © 2015 Safecast. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        appearanceSetup()
        
        return true
    }
    
    private func appearanceSetup() {
        let mainColor           = UIColor(named: .Main)
        let fontSize:CGFloat    = UIFont.systemFontSize()
        
        if #available(iOS 8.2, *) {
            let font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightLight)
            
            UINavigationBar.appearance().titleTextAttributes  = [NSFontAttributeName: font]
        } else {
            let font = UIFont.systemFontOfSize(fontSize)
            
            UINavigationBar.appearance().titleTextAttributes  = [NSFontAttributeName: font]
        }
        
        self.window?.tintColor                      = mainColor
        UIWindow.appearance().tintColor             = mainColor
        UIAlertView.appearance().tintColor          = mainColor
        UIActionSheet.appearance().tintColor        = mainColor
        UITabBar.appearance().translucent           = false
        UINavigationBar.appearance().translucent    = false
    }
}

