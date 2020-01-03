//
//  Framework2Manager.swift
//  Framework2
//
//  Created by Caesar Wirth on 1/3/20.
//  Copyright © 2020 Caesar Wirth. All rights reserved.
//

import Foundation

import AppCenter
import AppCenterCrashes

public class Framework2CrashDelegate: NSObject, MSCrashesDelegate {
    public static let shared = Framework2CrashDelegate()
}
