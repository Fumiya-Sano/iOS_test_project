//
//  MyData.swift
//  SimpleCustomClassDataStorage
//
//  Created by 佐野文哉 on 2018/09/12.
//  Copyright © 2018年 myname. All rights reserved.
//

import Foundation

class MyData:NSObject, NSCoding{
    var valueString: String?
    override init() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
        
    }
}
