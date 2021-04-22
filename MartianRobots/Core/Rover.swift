//
//  Rover.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation
import CoreGraphics

class Rover: Movable {
    
    var location: CGPoint
    
    var direction: Direction
    
    required init(_ origin: CGPoint, heading: Direction) {
        self.location = origin
        self.direction = heading
    }
    
}
