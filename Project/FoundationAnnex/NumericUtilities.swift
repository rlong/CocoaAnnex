//
//  NumericUtilities.swift
//  FoundationAnnexOsx
//
//  Created by rlong on 9/08/2015.
//
//

import Foundation


public class NumericUtilities {
    
    public static func parseInt( integerValue: String ) -> Int {
    
        
        if let answer = integerValue.toInt() {
            return answer
        } else {
            
            ErrorHelper.fail( "could not parse '\(integerValue)' as an Int" )
            return 0
        }
    }
}