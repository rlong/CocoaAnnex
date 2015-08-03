//
//  InputStreamHelper.swift
//  FoundationAnnex
//
//  Created by rlong on 1/08/2015.
//
//

import Foundation


public class InputStreamHelper: StreamHelper {
    
    
    static let BufferSize = 8 * 1024;
    
    public static func readDataFromStream( inputStream: NSInputStream, count: Int ) -> NSData  {
        
        return self.readMutableDataFromStream( inputStream, count: count)
        
    }
    
    public static func readMutableDataFromStream( inputStream: NSInputStream, count: Int ) -> NSMutableData {
        
        
        let answer = NSMutableData(length: count)
        
        if nil == answer {
            ErrorHelper.fail( "nil == answer; count = \(count)" )
        }
        
        let mutableBytes = UnsafeMutablePointer<UInt8>(answer!.mutableBytes)
        let bytesRead = inputStream.read( mutableBytes, maxLength: count)
        
        if( 0 > bytesRead ) {
            ErrorHelper.fail( "0 > bytesRead; bytesRead = \(bytesRead)" )
        }
        
        if( bytesRead != count ) {
        
            ErrorHelper.fail( "bytesRead != count; bytesRead = \(bytesRead); count = \(count)" )
            
        }
        
        return answer!;
        
    }
    
    
    public static func seek( inputStream: NSInputStream, to seekPosition: Int ) {
        
        if( 0 == seekPosition ) {
            return;
        }
        
        let accepted = inputStream.setProperty(seekPosition, forKey: NSStreamFileCurrentOffsetKey)
        if( !accepted ) {
            ErrorHelper.fail( "!accepted; seekPosition = \(seekPosition)" );
        }
        
    }

    
    public static func writeFrom( inputStream: NSInputStream, count: Int, to outputData: NSMutableData ) {
        
//        let buffer : UInt8[InputStreamHelper.BufferSize]; // fixed-length arrays are not yet supported
        
        let bufferWrapper = NSMutableData(length:InputStreamHelper.BufferSize)
        
        if nil == bufferWrapper {
            ErrorHelper.fail( "nil == bufferWrapper; InputStreamHelper.BufferSize = \(InputStreamHelper.BufferSize)" )
        }
        
        let buffer =  UnsafeMutablePointer<UInt8>(bufferWrapper!.mutableBytes)
        
        var numOctets = count
        while( numOctets > 0 ) {
            
            var amountToRead = InputStreamHelper.BufferSize
            
            if( amountToRead > numOctets ) {
                amountToRead = numOctets
            }
            
            let bytesRead = inputStream.read( buffer, maxLength: amountToRead)
            if( 0 == bytesRead ) {
                ErrorHelper.fail( "0 == bytesRead" );
            }
            outputData.appendBytes( buffer, length: bytesRead)
            numOctets -= bytesRead
        }
        
    }
    
    
    
    public static func writeFrom( inputStream: NSInputStream, count: Int, to outputStream: NSOutputStream ) {
        

        //        let buffer : UInt8[InputStreamHelper.BufferSize]; // fixed-length arrays are not yet supported
        
        let bufferWrapper = NSMutableData(length:InputStreamHelper.BufferSize)
        
        if nil == bufferWrapper {
            ErrorHelper.fail( "nil == bufferWrapper; InputStreamHelper.BufferSize = \(InputStreamHelper.BufferSize)" )
        }
        
        let buffer =  UnsafeMutablePointer<UInt8>(bufferWrapper!.mutableBytes)
        
        
        var bytesRemaining = count
        
        while( 0 < bytesRemaining ) {
            var bytesToRead = InputStreamHelper.BufferSize
            
            if( bytesToRead > bytesRemaining ) {
                bytesToRead = bytesRemaining
            }

            let bytesRead = inputStream.read( buffer, maxLength: bytesToRead)
            
            // error ?
            if( 0 > bytesRead ) {
                ErrorHelper.fail( "0 > bytesRead; bytesRead = \(bytesRead); bytesRemaining = \(bytesRemaining)" )
            }

            if( nil != inputStream.streamError ) {
                ErrorHelper.callTo( "NSInputStream.read()", failedWithError: inputStream.streamError!)
            }
            
            if( 0 == bytesRead && 0 != bytesRemaining ) {
                ErrorHelper.fail( "0 == bytesRead && 0 != bytesRemaining; bytesRemaining = \(bytesRemaining); inputStream.streamStatus = \(inputStream.streamStatus)"  )
            }
            
            bytesRemaining -= bytesRead;
            
            OutputStreamHelper.writeTo( outputStream, count: bytesRead, buffer: buffer)

        }
        
    }
    
    
    public static func writeFrom( inputStream: NSInputStream, count: Int, toFileDescriptor fd: Int32 ) {
        
        //        let buffer : UInt8[InputStreamHelper.BufferSize]; // fixed-length arrays are not yet supported
        
        let bufferWrapper = NSMutableData(length:InputStreamHelper.BufferSize)
        
        if nil == bufferWrapper {
            ErrorHelper.fail( "nil == bufferWrapper; InputStreamHelper.BufferSize = \(InputStreamHelper.BufferSize)" )
        }
        
        let buffer =  UnsafeMutablePointer<UInt8>(bufferWrapper!.mutableBytes)
        
        var bytesRemaining = count
        
        while( 0 < bytesRemaining ) {
            var bytesToRead = InputStreamHelper.BufferSize
            
            if( bytesToRead > bytesRemaining ) {
                bytesToRead = bytesRemaining
            }
            
            let bytesRead = inputStream.read( buffer, maxLength: bytesToRead)
            
            // error ?
            if( 0 > bytesRead ) {
                ErrorHelper.fail( "0 > bytesRead; bytesRead = \(bytesRead); bytesRemaining = \(bytesRemaining)" )
            }
            
            if( nil != inputStream.streamError ) {
                ErrorHelper.callTo( "NSInputStream.read()", failedWithError: inputStream.streamError!)
            }
            
            if( 0 == bytesRead && 0 != bytesRemaining ) {
                ErrorHelper.fail( "0 == bytesRead && 0 != bytesRemaining; bytesRemaining = \(bytesRemaining); inputStream.streamStatus = \(inputStream.streamStatus)"  )
            }
            
            bytesRemaining -= bytesRead;

            
            let bytesWritten = write( fd, buffer, bytesRead )
            
            // error
            if( -1 == bytesWritten ) {
                ErrorHelper.callTo( "write", failedWithErrno: errno)
            }
            
        }

    }

    
}