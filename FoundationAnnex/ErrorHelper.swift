//
//  ErrorHelper.swift
//  FoundationAnnexOsx
//
//  Created by rlong on 1/08/2015.
//  Copyright (c) 2015 rlong. All rights reserved.
//

import Foundation





class ErrorHelper {
    
    
    static func fail( message: String, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
    
        println("**ERROR** \(file.lastPathComponent).\(line): \(message)")
        
    
    }
    
    static func callTo( method: String, failedWithError error: NSError,  file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {

        println("**ERROR** \(file.lastPathComponent).\(line): '\(method)' call failed")

    }

    static func callTo( method: String, failedWithErrno errNumber: Int32,  file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
        
        println("**ERROR** \(file.lastPathComponent).\(line): '\(method)' call failed")
        
    }
    
    
}



