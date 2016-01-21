//
//  Node.swift
//  HelloWorld
//
//  Created by Leonardo Lobato on 1/19/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import Foundation

public class Node{
    
    var value:Int?
    var next:Node?
    var previous:Node?
    
    init(value:Int?){
        self.value = value
    }
    
}
