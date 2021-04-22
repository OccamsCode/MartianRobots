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
    
    //MARK:- Execute Commands - Empty
    func test_FiveFiveHeadingNorth_NoCommands_NoChangeInLocation() {
        
        let location = CGPoint(x: 5, y: 5)
        let rover = Rover(location, heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([])
        let result = rover.location
        
        XCTAssertEqual(result, location)
        
    }
    
    func test_FiveFiveHeadingNorth_NoCommands_NoChangeInHeading() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([])
        let result = rover.direction
        
        XCTAssertEqual(result, .north)
        
    }
    
    //MARK:- Execute Commands - Forward
    func test_FiveFiveHeadingNorth_SingleForward_MovesForward() {

        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([.forward])
        let result = rover.location
        
        XCTAssertEqual(result, CGPoint(x: 5, y: 6))
        
    }
    
    func test_FiveFiveHeadingNorth_MultipleForward_MovesForward() {

        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([.forward, .forward, .forward])
        let result = rover.location
        
        XCTAssertEqual(result, CGPoint(x: 5, y: 8))
        
    }
    
    //MARK:- Execute Commands - Turn Left
    func test_FiveFiveHeadingNorth_SingleTurnLeft_TurnsLeft() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 1))
        let result = rover.direction
        
        XCTAssertEqual(result, .west)
    }
    
    func test_FiveFiveHeadingNorth_DoubleTurnLeft_TurnsLeft() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 2))
        let result = rover.direction
        
        XCTAssertEqual(result, .south)
    }
    
    func test_FiveFiveHeadingNorth_TripleTurnLeft_TurnsLeft() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 3))
        let result = rover.direction
        
        XCTAssertEqual(result, .east)
    }
    
    func test_FiveFiveHeadingNorth_QuadTurnLeft_TurnsLeft() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 4))
        let result = rover.direction
        
        XCTAssertEqual(result, .north)
    }
    //MARK:- Execute Commands - Turn Right
    func test_FiveFiveHeadingNorth_SingleTurnRight_TurnsRight() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 1))
        let result = rover.direction
        
        XCTAssertEqual(result, .east)
    }
    
    func test_FiveFiveHeadingNorth_DoubleTurnRight_TurnsRight() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 2))
        let result = rover.direction
        
        XCTAssertEqual(result, .south)
    }
    
    func test_FiveFiveHeadingNorth_TripleTurnRight_TurnsRight() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 3))
        let result = rover.direction
        
        XCTAssertEqual(result, .west)
    }
    
    func test_FiveFiveHeadingNorth_QuadTurnRight_TurnsRight() {
        
        let rover = Rover(CGPoint(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 4))
        let result = rover.direction
        
        XCTAssertEqual(result, .north)
    }
}
