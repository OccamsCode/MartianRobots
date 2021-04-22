//
//  Rover.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation

class Rover: Movable {
    
    var location: Point
    
    var direction: Direction
    
    required init(_ origin: Point, heading: Direction) {
        self.location = origin
        self.direction = heading
    }
    
}
