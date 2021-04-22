//
//  LocomotionTests.swift
//  MartianRobotsTests
//
//  Created by Brian Munjoma on 22/04/2021.
//

import XCTest
@testable import MartianRobots

class LocomotionTests: XCTestCase {
    
    var mockPlanet: Environment!

    override func setUpWithError() throws {
        mockPlanet = Planet(.zero, width: 10, height: 10)
    }

    override func tearDownWithError() throws {
        mockPlanet = nil
    }

    //MARK:- Move Forward
    func test_MoveForward_HeadingNorthFromFiveFive() throws {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()

        XCTAssertEqual(result, CGPoint(x: 5, y: 6))
    }
    
    func test_MoveForward_HeadingEastFromFiveFive() throws {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .east)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()

        XCTAssertEqual(result, CGPoint(x: 6, y: 5))
    }
    
    func test_MoveForward_HeadingSouthFromFiveFive() throws {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .south)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()

        XCTAssertEqual(result, CGPoint(x: 5, y: 4))
    }
    
    func test_MoveForward_HeadingWestFromFiveFive() throws {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .west)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()

        XCTAssertEqual(result, CGPoint(x: 4, y: 5))
    }
    
    //MARK:- Turn Left
    func test_HeadingNorth_TurnLeft() {
        
        let rover = Rover(.zero, heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnLeft()

        XCTAssertEqual(result, .west)
        
    }
    
    func test_HeadingEast_TurnLeft() {
        
        let rover = Rover(.zero, heading: .east)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnLeft()

        XCTAssertEqual(result, .north)
        
    }
    
    func test_HeadingSouth_TurnLeft() {
        
        let rover = Rover(.zero, heading: .south)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnLeft()

        XCTAssertEqual(result, .east)
        
    }
    
    func test_HeadingWest_TurnLeft() {
        
        let rover = Rover(.zero, heading: .west)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnLeft()

        XCTAssertEqual(result, .south)
        
    }
    
    //MARK:- Turn Right
    func test_HeadingNorth_TurnRight() {
        
        let rover = Rover(.zero, heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnRight()

        XCTAssertEqual(result, .east)
        
    }
    
    func test_HeadingEast_TurnRight() {
        
        let rover = Rover(.zero, heading: .east)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnRight()

        XCTAssertEqual(result, .south)
        
    }
    
    func test_HeadingSouth_TurnRight() {
        
        let rover = Rover(.zero, heading: .south)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnRight()

        XCTAssertEqual(result, .west)
        
    }
    
    func test_HeadingWest_TurnRight() {
        
        let rover = Rover(.zero, heading: .west)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.turnRight()

        XCTAssertEqual(result, .north)
        
    }

}
