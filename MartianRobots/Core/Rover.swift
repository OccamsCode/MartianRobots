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
    var currentStatus: Status
    
    required init(_ origin: Point, heading: Direction, currentStatus: Status = .ok) {
        self.location = origin
        self.direction = heading
        self.currentStatus = currentStatus
    }
    
}
