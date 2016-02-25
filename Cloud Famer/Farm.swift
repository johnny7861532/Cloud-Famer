//
//  Farm.swift
//  Cloud Famer
//
//  Created by Johnny' mac on 2016/2/23.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import Foundation
class Farm{
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name:String, type:String, location:String, image:String, isVisited:Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
    
    
}
