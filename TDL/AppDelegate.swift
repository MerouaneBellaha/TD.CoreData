//
//  AppDelegate.swift
//  TDL
//
//  Created by Merouane Bellaha on 22/06/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack(containerName: "TaskModel")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let navigationVC = window?.rootViewController as? UINavigationController,
            let mainVC = navigationVC.topViewController as? ViewController else {
                fatalError("Storyboard Setup error")
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }

        mainVC.coreDataManager = CoreDataManager(with: appDelegate.coreDataStack)


        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        coreDataStack.saveContext()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
}

