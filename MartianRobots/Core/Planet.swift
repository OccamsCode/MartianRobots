//
//  Planet.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation

class Planet: Environment {
    
    let size: Rect
    var scents: Scents
    
    required init(_ origin: Point, width: Int, height: Int, scents: Scents = [:]) {
        self.size = Rect(origin, size: Size(width: width, height: height))
        self.scents = scents
    }
    
    func exists(_ location: Point) -> Bool {
        return size.contains(location)
    }
    
    func containsScent(at location: Point, heading: Direction) -> Bool {
        
        guard let directions = scents[location] else { return false }
        return directions.contains(heading)
    }
    
    func addScent(at location: Point, heading: Direction) {
        
        scents[location, default: []].append(heading)
    }
    
}
