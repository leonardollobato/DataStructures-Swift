//
//  Stack.swift
//  HelloWorld
//
//  Created by Leonardo Lobato on 1/21/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import Foundation

protocol Stack{
    func pop() -> Int?
    func peek() -> Int?
    func getSize() -> Int
    func push(item:Int) -> Void
    func isEmpty() -> Bool
}