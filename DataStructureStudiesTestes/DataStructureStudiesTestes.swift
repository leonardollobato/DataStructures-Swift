//
//  DataStructureStudiesTestes.swift
//  DataStructureStudiesTestes
//
//  Created by Leonardo Lobato on 1/21/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import XCTest

class DataStructureStudiesTestes: XCTestCase {
    
    var _stack:Stack!
    
    override func setUp() {
        super.setUp()
        _stack = ArrayStack()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    private func addItems(times:Int){
        for index in 1...times{
            _stack.push(index * 10)
        }
    }
    
    
    
    func testPushItemToArray(){
        let size = 2;
        self.addItems(size)
        XCTAssertEqual(_stack.getSize(), size)
    }
    
    func testIsEmptyTrue(){
        XCTAssertTrue(_stack.isEmpty())
    }
    
    func testIsEmptyFalse(){
        self.addItems(2)
        XCTAssertFalse(_stack.isEmpty())
    }
    
    func testPeekTopItemFromArray(){
        self.addItems(2)
        XCTAssertEqual(_stack.peek(), 20)
    }
    
    func testPopShouldReturn(){
        self.addItems(3)
        XCTAssertEqual(_stack.pop(), 30)
    }
    
    func testPopShouldRemoveReference(){
        self.addItems(3)
        _stack.pop()
        XCTAssertEqual(_stack.peek(), 20)
    }
    
    func testAfterPopItemOverrideRemovedItemWithNewOne(){
        self.addItems(3)
        _stack.pop()
        _stack.push(40)
        XCTAssertEqual(_stack.peek(), 40)
    }

    
}
