//
//  PlanetTests.swift
//  MartianRobotsTests
//
//  Created by Brian Munjoma on 22/04/2021.
//

import XCTest
@testable import MartianRobots

class PlanetTests: XCTestCase {

    //MARK:- Init Location
    func test_InitialPlanet_Origin_ZeroZero() {
        
        let location = Point(x: 0, y: 0)
        let sut = Planet(location, width: 0, height: 0)
        
        let result = sut.size.origin
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialPlanet_Origin_OneZero() {
        
        let location = Point(x: 1, y: 0)
        let sut = Planet(location, width: 0, height: 0)
        
        let result = sut.size.origin
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialPlanet_Origin_ZeroOne() {
        
        let location = Point(x: 0, y: 1)
        let sut = Planet(location, width: 0, height: 0)
        
        let result = sut.size.origin
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialPlanet_Origin_OneOne() {
        
        let location = Point(x: 1, y: 1)
        let sut = Planet(location, width: 0, height: 0)
        
        let result = sut.size.origin
        
        XCTAssertEqual(result, location)
    }
    
    //MARK:- Init Width
    func test_InitialPlanet_Width_Zero() {
        
        let width = 0
        let sut = Planet(.zero, width: width, height: 0)
        
        let result = Int(sut.size.width)
        
        XCTAssertEqual(result, width)
    }
    
    func test_InitialPlanet_Width_Three() {
        
        let width = 3
        let sut = Planet(.zero, width: width, height: 0)
        
        let result = Int(sut.size.width)
        
        XCTAssertEqual(result, width)
    }
    
    //MARK:- Init Height
    func test_InitialPlanet_Height_Zero() {
        
        let height = 0
        let sut = Planet(.zero, width: 0, height: height)
        
        let result = Int(sut.size.height)
        
        XCTAssertEqual(result, height)
    }
    
    func test_InitialPlanet_Height_Three() {
        
        let height = 3
        let sut = Planet(.zero, width: 0, height: height)
        
        let result = Int(sut.size.height)
        
        XCTAssertEqual(result, height)
    }
    
    //MARK:- Can Move To Location
    func test_TwoByTwoPlanet_ExistsZeroZero() {
        
        let sut = Planet(.zero, width: 2, height: 2)
        let location = Point(x: 0, y: 0)
        
        let result = sut.exists(location)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoPlanet_ExistsZeroOne() {
        
        let sut = Planet(.zero, width: 2, height: 2)
        let location = Point(x: 0, y: 1)
        
        let result = sut.exists(location)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoPlanet_ExistsZeroTwo() {
        
        let sut = Planet(.zero, width: 2, height: 2)
        let location = Point(x: 0, y: 2)
        
        let result = sut.exists(location)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoPlanet_NotExistsZeroThree() {
        
        let sut = Planet(.zero, width: 2, height: 2)
        let location = Point(x: 0, y: 3)
        
        let result = sut.exists(location)
        
        XCTAssertFalse(result)
    }
    
    func test_TwoByTwoPlanet_ExistsOneZero() {
        
        let sut = Planet(.zero, width: 2, height: 2)
        let location = Point(x: 1, y: 0)
        
        let result = sut.exists(location)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoPlanet_ExistsTwoZero() {
        
        let sut = Planet(.zero, width: 2, height: 2)
        let location = Point(x: 2, y: 0)
        
        let result = sut.exists(location)
        
        XCTAssertTrue(result)
    }
    
    func test_TwoByTwoPlanet_NotExistsThreeZero() {
        
        let sut = Planet(.zero, width: 2, height: 2)
        let location = Point(x: 3, y: 0)
        
        let result = sut.exists(location)
        
        XCTAssertFalse(result)
    }
}
