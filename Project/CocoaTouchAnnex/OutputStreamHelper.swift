//
//  OutputStreamHelper.swift
//  FoundationAnnexOsx
//
//  Created by rlong on 1/08/2015.
//
//

import Foundation


class OutputStreamHelper: StreamHelper {

    
    static func writeTo( outputStream: NSOutputStream, count: Int, buffer: UnsafeMutablePointer<UInt8> ) {
        
        var bytesRemaining = count
        var bufferOffset = 0;
        
        while( 0 < bytesRemaining ) {
            
            let offsetBuffer = buffer.advancedBy( bufferOffset )
            let numBytesWritten = outputStream.write( offsetBuffer, maxLength: bytesRemaining)
            
            // error 
            if( 0 > numBytesWritten ) {
                
                // More information about the error can be obtained with streamError
                let error = outputStream.streamError!;
                
                let errorBuilder = ErrorBuilder(callTo: "outputStream.write()", failedWithError: error)
                if( EPIPE == Int32(error.code) ) {
                    errorBuilder.domain = StreamHelper.ErrorDomain.BrokenPipe.rawValue
                }
                errorBuilder.buildAndRaise();
                
            }
            
            bytesRemaining -= numBytesWritten;
            bufferOffset += numBytesWritten;

        }
    }
    
}