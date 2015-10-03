//
//  ErrorBuilder.swift
//  FoundationAnnexOsx
//
//  Created by rlong on 2/08/2015.
//
//

import Foundation




public class ErrorBuilder {
    
    
    var domain: String
    var code: Int
    let userInfo: [String: AnyObject]
    
    init( file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__)  {
        
        self.domain = "\(file).\(line)"
        self.code = 0
        userInfo = [String: AnyObject]()
    }
    
    init( error: NSError, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__)  {
        
        self.domain = "\(file).\(line)"
        self.code = 0
        userInfo = [String: AnyObject]()
    }
    
    init( callTo method: String, failedWithError error: NSError, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__)  {
        
        self.domain = "\(file).\(line)"
        self.code = 0
        userInfo = [String: AnyObject]()
        
    }
    
    static func errorForFail( message: String, file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) -> NSError {
        
        let userInfo = [String:AnyObject]()
        return NSError()
        
    }
    
    static func errorForCallTo( method: String, failedWithError error: NSError,  file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) -> NSError {
        
        return NSError()
        
    }
    
    static func errorForCallTo( method: String, failedWithErrno errNumber: Int32,  file: String = __FILE__, line: Int = __LINE__, function: String = __FUNCTION__) -> NSError {
        
        return NSError()
        
    }

    // we will replace this method with a 'build' method throw the resulting error when Swift 2.0 is released
    func buildAndRaise() {
        
        ErrorHandler.defaultErrorHandler.raise( NSError() )
        
        
    }
    
    
}

