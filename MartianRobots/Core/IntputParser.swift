//
//  IntputParser.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation

enum Token: Equatable {
    case planet(_ size: Size)
    case rover(_ point: Point, direction: Direction)
    case commands(_ move: [Command])
}

enum ParserError: Error {
    case noData
    case coordinateFormatInvalid
    case coordinateArguementCountInvalid
}

struct InputParser {
    
    static func parse(_ s: String) throws -> [Token] {
        
        if s.isEmpty { throw ParserError.noData }
        
        let items = s.components(separatedBy: "\n")
        
        guard let planetCoord = items.first else { throw ParserError.noData }
        
        if planetCoord.count != 2 { throw ParserError.coordinateArguementCountInvalid }
        
        guard let width = planetCoord.first?.wholeNumberValue, let height = planetCoord.last?.wholeNumberValue else { throw ParserError.coordinateFormatInvalid }
        
        return [Token.planet(Size(width: width, height: height))]
    }
    
}
