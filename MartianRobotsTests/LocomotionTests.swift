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
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()
        
        XCTAssertEqual(result, Point(x: 5, y: 6))
    }
    
    func test_MoveForward_HeadingEastFromFiveFive() throws {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .east)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()
        
        XCTAssertEqual(result, Point(x: 6, y: 5))
    }
    
    func test_MoveForward_HeadingSouthFromFiveFive() throws {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .south)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()
        
        XCTAssertEqual(result, Point(x: 5, y: 4))
    }
    
    func test_MoveForward_HeadingWestFromFiveFive() throws {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .west)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let result = sut.moveForward()
        
        XCTAssertEqual(result, Point(x: 4, y: 5))
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
        
        let location = Point(x: 5, y: 5)
        let rover = Rover(location, heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([])
        let result = rover.location
        
        XCTAssertEqual(result, location)
        
    }
    
    func test_FiveFiveHeadingNorth_NoCommands_NoChangeInHeading() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([])
        let result = rover.direction
        
        XCTAssertEqual(result, .north)
        
    }
    
    //MARK:- Execute Commands - Forward
    func test_FiveFiveHeadingNorth_SingleForward_MovesForward() {

        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([.forward])
        let result = rover.location
        
        XCTAssertEqual(result, Point(x: 5, y: 6))
        
    }
    
    func test_FiveFiveHeadingNorth_MultipleForward_MovesForward() {

        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute([.forward, .forward, .forward])
        let result = rover.location
        
        XCTAssertEqual(result, Point(x: 5, y: 8))
        
    }
    
    //MARK:- Execute Commands - Turn Left
    func test_FiveFiveHeadingNorth_SingleTurnLeft_TurnsLeft() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 1))
        let result = rover.direction
        
        XCTAssertEqual(result, .west)
    }
    
    func test_FiveFiveHeadingNorth_DoubleTurnLeft_TurnsLeft() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 2))
        let result = rover.direction
        
        XCTAssertEqual(result, .south)
    }
    
    func test_FiveFiveHeadingNorth_TripleTurnLeft_TurnsLeft() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 3))
        let result = rover.direction
        
        XCTAssertEqual(result, .east)
    }
    
    func test_FiveFiveHeadingNorth_QuadTurnLeft_TurnsLeft() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.left, count: 4))
        let result = rover.direction
        
        XCTAssertEqual(result, .north)
    }
    //MARK:- Execute Commands - Turn Right
    func test_FiveFiveHeadingNorth_SingleTurnRight_TurnsRight() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 1))
        let result = rover.direction
        
        XCTAssertEqual(result, .east)
    }
    
    func test_FiveFiveHeadingNorth_DoubleTurnRight_TurnsRight() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 2))
        let result = rover.direction
        
        XCTAssertEqual(result, .south)
    }
    
    func test_FiveFiveHeadingNorth_TripleTurnRight_TurnsRight() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 3))
        let result = rover.direction
        
        XCTAssertEqual(result, .west)
    }
    
    func test_FiveFiveHeadingNorth_QuadTurnRight_TurnsRight() {
        
        let rover = Rover(Point(x: 5, y: 5), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        sut.execute(Array(repeating: Command.right, count: 4))
        let result = rover.direction
        
        XCTAssertEqual(result, .north)
    }
    
    //MARK:- Sample Input
    
    /*
     Input:
     53
     11E
     RFRFRFRF
     
     Output:
     11E
     */
    func test_SampleInputOne_Location() {
        
        mockPlanet = Planet(.zero, width: 5, height: 3)
        let rover = Rover(Point(x: 1, y: 1), heading: .east)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let commands = [Command.right, .forward, .right, .forward, .right, .forward, .right, .forward]
        sut.execute(commands)
        
        let result = rover.location
        
        XCTAssertEqual(result, Point(x: 1, y: 1))
    }
    
    func test_SampleInputOne_Heading() {
        
        mockPlanet = Planet(.zero, width: 5, height: 3)
        let rover = Rover(Point(x: 1, y: 1), heading: .east)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let commands = [Command.right, .forward, .right, .forward, .right, .forward, .right, .forward]
        sut.execute(commands)
        
        let result = rover.direction
        
        XCTAssertEqual(result, .east)
    }
    
    func test_SampleInputOne_StatusOk() {
        
        mockPlanet = Planet(.zero, width: 5, height: 3)
        let rover = Rover(Point(x: 1, y: 1), heading: .east)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let commands = [Command.right, .forward, .right, .forward, .right, .forward, .right, .forward]
        sut.execute(commands)
        
        let result = rover.currentStatus
        
        XCTAssertEqual(result, .ok)
    }
    
    /*
     Input:
     53
     32N
     FRR FLL FFR RFLL
     
     Output:
     33NLOST
     */
    func test_SampleInputTwo_Location() {
        
        mockPlanet = Planet(.zero, width: 5, height: 3)
        let rover = Rover(Point(x: 3, y: 2), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let commands = [
            Command.forward, .right, .right,
            .forward, .left, .left,
            .forward, .forward, .right,
            .right, .forward, .left, .left
        ]
        sut.execute(commands)
        
        let result = rover.location
        
        XCTAssertEqual(result, Point(x: 3, y: 3))
    }
    
    func test_SampleInputTwo_Heading() {
        
        mockPlanet = Planet(.zero, width: 5, height: 3)
        let rover = Rover(Point(x: 3, y: 2), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let commands = [
            Command.forward, .right, .right,
            .forward, .left, .left,
            .forward, .forward, .right,
            .right, .forward, .left, .left
        ]
        sut.execute(commands)
        
        let result = rover.direction
        
        XCTAssertEqual(result, .north)
    }
    
    func test_SampleInputTwo_StatusLost() {
        
        mockPlanet = Planet(.zero, width: 5, height: 3)
        let rover = Rover(Point(x: 3, y: 2), heading: .north)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let commands = [
            Command.forward, .right, .right,
            .forward, .left, .left,
            .forward, .forward, .right,
            .right, .forward, .left, .left
        ]
        sut.execute(commands)
        
        let result = rover.currentStatus
        
        XCTAssertEqual(result, .lost)
    }

    /*
     Input:
     53
     03W
     LLF FFL FLFL
     
     Output:
     23S
     */
    func test_SampleInputThree_Location() {
        
        let scent = [
            Point(x: 3, y: 3): [Direction.north]
        ]
        mockPlanet = Planet(.zero, width: 5, height: 3, scents: scent)
        let rover = Rover(Point(x: 0, y: 2), heading: .west)
        let sut = Locomotion(on: rover, in: mockPlanet)
        
        let commands = [
            Command.left, .left, .forward,
            .forward, .forward, .left,
            .forward, .left, .forward, .left
        ]
        sut.execute(commands)
        
        let result = rover.location
        
        XCTAssertEqual(result, Point(x: 2, y: 3))
    }
    
    /*
     Input
     22
     11S
     FFF FFF
     
     11S
     FFF FFR
     
     Output
     00SLOST
     
     00E
     */
    func test_CustomInput_FistObjectLocation() {
        
        mockPlanet = Planet(.zero, width: 2, height: 2)
        let roverOne = Rover(Point(x: 1, y: 1), heading: .south)
        let sut = Locomotion(on: roverOne, in: mockPlanet)
        
        let commands = [
            Command.forward, .forward, .forward, .forward, .forward, .forward
        ]
        
        sut.execute(commands)
        
        let result = roverOne.location
        
        XCTAssertEqual(result, Point(x: 1, y: 0))
    }
    
    func test_CustomInput_FistObjectHeading() {
        
        mockPlanet = Planet(.zero, width: 2, height: 2)
        let roverOne = Rover(Point(x: 1, y: 1), heading: .south)
        let sut = Locomotion(on: roverOne, in: mockPlanet)
        
        let commands = [
            Command.forward, .forward, .forward, .forward, .forward, .forward
        ]
        
        sut.execute(commands)
        
        let result = roverOne.direction
        
        XCTAssertEqual(result, .south)
    }
    
    func test_CustomInput_FistObjectStatus() {
        
        mockPlanet = Planet(.zero, width: 2, height: 2)
        let roverOne = Rover(Point(x: 1, y: 1), heading: .south)
        let sut = Locomotion(on: roverOne, in: mockPlanet)
        
        let commands = [
            Command.forward, .forward, .forward, .forward, .forward, .forward
        ]
        
        sut.execute(commands)
        
        let result = roverOne.currentStatus
        
        XCTAssertEqual(result, .lost)
    }
    
    func test_CustomInput_SecondObjectLocation() {
        
        mockPlanet = Planet(.zero, width: 2, height: 2)
        let roverOne = Rover(Point(x: 1, y: 1), heading: .south)
        var sut = Locomotion(on: roverOne, in: mockPlanet)
        
        var commands = [
            Command.forward, .forward, .forward, .forward, .forward, .forward
        ]
        
        sut.execute(commands)
        
        let roverTwo = Rover(Point(x: 1, y: 1), heading: .south)
        
        commands = [
            Command.forward, .forward, .forward, .forward, .forward, .right
        ]
        
        sut = Locomotion(on: roverTwo, in: mockPlanet)
        
        sut.execute(commands)
        
        let result = roverTwo.location
        
        XCTAssertEqual(result, Point(x: 1, y: 0))
    }
    
    func test_CustomInput_SecondObjectHeading() {
        
        mockPlanet = Planet(.zero, width: 2, height: 2)
        let roverOne = Rover(Point(x: 1, y: 1), heading: .south)
        var sut = Locomotion(on: roverOne, in: mockPlanet)
        
        var commands = [
            Command.forward, .forward, .forward, .forward, .forward, .forward
        ]
        
        sut.execute(commands)
        
        let roverTwo = Rover(Point(x: 1, y: 1), heading: .south)
        
        commands = [
            Command.forward, .forward, .forward, .forward, .forward, .right
        ]
        
        sut = Locomotion(on: roverTwo, in: mockPlanet)
        
        sut.execute(commands)
        
        let result = roverTwo.direction
        
        XCTAssertEqual(result, .west)
    }
    
    func test_CustomInput_SecondObjectStatus() {
        
        mockPlanet = Planet(.zero, width: 2, height: 2)
        let roverOne = Rover(Point(x: 1, y: 1), heading: .south)
        var sut = Locomotion(on: roverOne, in: mockPlanet)
        
        var commands = [
            Command.forward, .forward, .forward, .forward, .forward, .forward
        ]
        
        sut.execute(commands)
        
        let roverTwo = Rover(Point(x: 1, y: 1), heading: .south)
        
        commands = [
            Command.forward, .forward, .forward, .forward, .forward, .right
        ]
        
        sut = Locomotion(on: roverTwo, in: mockPlanet)
        
        sut.execute(commands)
        
        let result = roverTwo.currentStatus
        
        XCTAssertEqual(result, .ok)
    }
}
