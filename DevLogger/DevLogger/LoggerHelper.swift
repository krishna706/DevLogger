//
//  LoggerHelper.swift
//  RapidLogger
//
//  Created by Orbysol on 3/19/18.
//  Copyright © 2018 Orbysol. All rights reserved.
//

import Foundation

func print(_ items: Any..., separator:String = " ", terminator:String = "\n") {
    let outPut = items.map {"\($0)"}.joined(separator: separator)
    RapidLogger.sharedController().printLog(outPut)
    NSLog("\(outPut)")
}
