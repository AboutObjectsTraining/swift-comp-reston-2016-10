//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

open class Author: ModelObject
{
    open var firstName = ""
    open var lastName = ""
    
    open var fullName: String {
        return (firstName + " " + lastName).trimmingCharacters(
            in: CharacterSet.whitespaces)
    }
    
    open override var description: String {
        return fullName
    }
    
    override class func keys() -> [String]
    {
        return ["firstName", "lastName"]
    }
}
