//
//  RoverTests.swift
//  MartianRobotsTests
//
//  Created by Brian Munjoma on 22/04/2021.
//

import XCTest
@testable import MartianRobots

class RoverTests: XCTestCase {

    //MARK:- Init Location
    func test_InitialRover_Location_ZeroZero() {
        
        let location = CGPoint(x: 0, y: 0)
        let sut = Rover(location, heading: .north)
        
        let result = sut.location
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialRover_Location_OneZero() {
        
        let location = CGPoint(x: 1, y: 0)
        let sut = Rover(location, heading: .north)
        
        let result = sut.location
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialRover_Location_ZeroOne() {
        
        let location = CGPoint(x: 0, y: 1)
        let sut = Rover(location, heading: .north)
        
        let result = sut.location
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialRover_Location_OneOne() {
        
        let location = CGPoint(x: 0, y: 0)
        let sut = Rover(location, heading: .north)
        
        let result = sut.location
        
        XCTAssertEqual(result, location)
    }

    //MARK:- Init Direction
    func test_InitialRover_Direction_North() {
        
        let direction = Direction.north
        let sut = Rover(CGPoint.zero, heading: direction)
        
        let result = sut.direction
        
        XCTAssertEqual(result, direction)
    }
    
    func test_InitialRover_Direction_East() {
        
        let direction = Direction.east
        let sut = Rover(CGPoint.zero, heading: direction)
        
        let result = sut.direction
        
        XCTAssertEqual(result, direction)
    }
    
    func test_InitialRover_Direction_South() {
        
        let direction = Direction.south
        let sut = Rover(CGPoint.zero, heading: direction)
        
        let result = sut.direction
        
        XCTAssertEqual(result, direction)
    }
    
    func test_InitialRover_Direction_West() {
        
        let direction = Direction.west
        let sut = Rover(CGPoint.zero, heading: direction)
        
        let result = sut.direction
        
        XCTAssertEqual(result, direction)
    }
}
