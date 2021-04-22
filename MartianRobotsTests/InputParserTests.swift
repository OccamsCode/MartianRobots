//
//  InputParserTests.swift
//  MartianRobotsTests
//
//  Created by Brian Munjoma on 22/04/2021.
//

import XCTest
@testable import MartianRobots

class InputParserTests: XCTestCase {

    func test_ParseEmptyString_ThrowsErrorNoData() {
        
        let input = String()
        
        XCTAssertThrowsError(try InputParser.parse(input), "Given an empty string, ParseError.noData should be thrown") { error in
            XCTAssertEqual(error as! ParserError, ParserError.noData)
        }
    }
    
    func test_ParseAlphaString_ThrowsCoordinateFormatInvalid() {
        
        let input = "AA"
        
        XCTAssertThrowsError(try InputParser.parse(input), "Given an invalid string, ParseError.coordinateFormatInvalid should be thrown") { error in
            XCTAssertEqual(error as! ParserError, ParserError.coordinateFormatInvalid)
        }
        
    }
    
    func test_ParseHeavyNumericString_ThrowsCoordinateArguementCountInvalid() {
        
        let input = "123"
        
        XCTAssertThrowsError(try InputParser.parse(input), "Given an invalid string, ParseError.coordinateArguementCountInvalid should be thrown") { error in
            XCTAssertEqual(error as! ParserError, ParserError.coordinateArguementCountInvalid)
        }
        
    }
    
    func test_ParserValidPlanetInput_NoThrows() {
        
        let input = "53"
        
        XCTAssertNoThrow(try InputParser.parse(input))
    }

    func test_ParserValidPlanetInput_CorrectPlanetToken() {
        
        let input = "53"
        let expectedOutput = Token.planet(Size(width: 5, height: 3))
        
        let result = try? InputParser.parse(input)
        
        XCTAssertEqual(result, [expectedOutput])
    }
}
