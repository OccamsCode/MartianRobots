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

}
