//
//  main.swift
//  DataStructureStudies
//
//  Created by Leonardo Lobato on 1/21/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import Foundation

let _stack = ArrayStack()


_stack.push(1)
_stack.push(2)
_stack.push(3)

print(_stack.toString())

_stack.pop()
_stack.pop()
_stack.pop()

print(_stack.toString())


_stack.push(5)
_stack.push(25)
_stack.push(125)

print(_stack.toString())

print("PEEK: \(_stack.peek()!)")



