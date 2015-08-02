//
//  ErrorHelper.swift
//  FoundationAnnexOsx
//
//  Created by rlong on 1/08/2015.
//  Copyright (c) 2015 rlong. All rights reserved.
//

import Foundation





class ErrorHelper {
    
    
    
    
    static func callTo( method: String, failedWithError error: NSError,  file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {

        println("**ERROR** \(file.lastPathComponent).\(line): '\(method)' call failed")
        let error = ErrorBuilder.errorForCallTo( method, failedWithError: error, file: file, line: line, function: function )
        throwError( error )

    }

    static func callTo( method: String, failedWithErrno errNumber: Int32,  file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
        
        println("**ERROR** \(file.lastPathComponent).\(line): '\(method)' call failed")
        let error = ErrorBuilder.errorForCallTo( method, failedWithErrno: errNumber, file: file, line: line, function: function )
        throwError( error )
        
    }
    
    static func fail( message: String, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) {
        
        println("**ERROR** \(file.lastPathComponent).\(line): \(message)")
        let error = ErrorBuilder.errorForFail( message, file: file, line: line, function: function )
        throwError( error )
        
    }
    
    static func throwError( error: NSError ) {
        
        println( "**ERROR** ErrorHelper.throw is a no-op as of Swift 1.2" )
        
    }
    
}



