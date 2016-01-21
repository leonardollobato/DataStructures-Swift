//
//  ArrayStack.swift
//  HelloWorld
//
//  Created by Leonardo Lobato on 1/21/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import Foundation

class ArrayStack:Stack{
    
    private var _array:[Int]
    private var _top = -1
    private var _size = 0
    
    init(){
        _array = [Int]()
    }
    
    func peek() -> Int? {
        if self.isEmpty() {
            return nil
        }
        return _array[_top]
    }
    
    func pop() -> Int? {
        if self.isEmpty() {
            return nil
        }
        self._size--
        
        let temp = _array[_top]
        
        _array.removeAtIndex(_top)
        _top--
        
        return temp
    }
    
    func getSize() -> Int {
        return self._size
    }
    
    func isEmpty() -> Bool {
        return self._size == 0 ? true : false
    }
    
    func toString() -> String{
        var result = ""
        
        for var index = (_array.count - 1); index >= 0; index-- {
            result += "|\(_array[index])|\n"
        }


        return result
    }
    
    func push(item: Int) {
        
        self._top++
        
        // Em Swift o array só pode ser incrementado através do método append()
        // logo, quando é preciso sobreescrever com um novo valor uma posição
        // antes ocupada, temos um problema.
        
        // Este if, resolve.
        
        if _array.count > (self._top - 1){
            self._array.insert(item, atIndex: self._top)
        }else{
            self._array.append(item)
        }
        
        self._size++
    }
    
}