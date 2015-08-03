//
//  StreamHelper.swift
//  FoundationAnnexOsx
//
//  Created by rlong on 2/08/2015.
//
//

import Foundation

public class StreamHelper {

    enum ErrorDomain: String {
        case BrokenPipe = "StreamHelper.BrokenPipe"
    }
    

    public static func closeStream( stream: NSStream?, swallowErrors: Bool, file: String = __FILE__, function: String = __FUNCTION__ ) {
        
        stream?.close();
        
    }
    
}