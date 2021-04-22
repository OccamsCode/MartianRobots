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
        
        let location = CGPoint(x: 0, y: 0)
        let sut = Planet(location, width: 0, height: 0)
        
        let result = sut.size.origin
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialPlanet_Origin_OneZero() {
        
        let location = CGPoint(x: 1, y: 0)
        let sut = Planet(location, width: 0, height: 0)
        
        let result = sut.size.origin
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialPlanet_Origin_ZeroOne() {
        
        let location = CGPoint(x: 0, y: 1)
        let sut = Planet(location, width: 0, height: 0)
        
        let result = sut.size.origin
        
        XCTAssertEqual(result, location)
    }
    
    func test_InitialPlanet_Origin_OneOne() {
        
        let location = CGPoint(x: 1, y: 1)
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
}
