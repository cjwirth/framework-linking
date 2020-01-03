//
//  Framework1.swift
//  Framework1
//
//  Created by Caesar Wirth on 1/3/20.
//  Copyright © 2020 Caesar Wirth. All rights reserved.
//

import Foundation

import AppCenter
import AppCenterCrashes

public class Framework1Manager: NSObject {

    public static func start(delegate: MSCrashesDelegate?) {
        MSCrashes.setDelegate(delegate)
        MSAppCenter.configure(withAppSecret: "example")
        MSAppCenter.start(withServices: [MSCrashes.self])
    }

}
