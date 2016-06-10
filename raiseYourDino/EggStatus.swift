//
//  EggStatus.swift
//  raiseYourDino
//
//  Created by Meitar Basson on 09/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation

class EggStatus: Properties {
    
    private var _name: String!
    
    var name: String{
        get{
            return _name
        }
    }
    
    convenience init(name: String){
        self.init()
        _name = name
    }
}