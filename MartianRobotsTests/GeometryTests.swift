//
//  GeometryTests.swift
//  MartianRobotsTests
//
//  Created by Brian Munjoma on 22/04/2021.
//

import XCTest
@testable import MartianRobots

class GeometryTests: XCTestCase {

    func test_TwoByTwoRect_Contains_PointZeroZero() {
        
        let sut = Rect(.zero, width: 2, height: 2)
        let point = Point(x: 0, y: 0)
        
        let result = sut.contains(point)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoRect_Contains_PointZeroOne() {
        
        let sut = Rect(.zero, width: 2, height: 2)
        let point = Point(x: 0, y: 1)
        
        let result = sut.contains(point)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoRect_Contains_PointZeroTwo() {
        
        let sut = Rect(.zero, width: 2, height: 2)
        let point = Point(x: 0, y: 2)
        
        let result = sut.contains(point)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoRect_NotContains_PointZeroThree() {
        
        let sut = Rect(.zero, width: 2, height: 2)
        let point = Point(x: 0, y: 3)
        
        let result = sut.contains(point)
        
        XCTAssertFalse(result)
    }
    
    func test_TwoByTwoRect_Contains_PointOneZero() {
        
        let sut = Rect(.zero, width: 2, height: 2)
        let point = Point(x: 1, y: 0)
        
        let result = sut.contains(point)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoRect_Contains_PointTwoZero() {
        
        let sut = Rect(.zero, width: 2, height: 2)
        let point = Point(x: 2, y: 0)
        
        let result = sut.contains(point)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoRect_NotContains_PointThreeZero() {
        
        let sut = Rect(.zero, width: 2, height: 2)
        let point = Point(x: 3, y: 0)
        
        let result = sut.contains(point)
        
        XCTAssertFalse(result)
    }

}
