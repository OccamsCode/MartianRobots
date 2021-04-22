//
//  Locomotion.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation
import CoreGraphics

class Locomotion {
    
    let environment: Environment
    let object: Movable
    
    init(on object: Movable, in environment: Environment) {
        self.environment = environment
        self.object = object
    }
    
    func moveForward() -> CGPoint {
        
        var newLocation = object.location
        
        switch object.direction {
        case .east:
            newLocation.x += 1
        case .west:
            newLocation.x -= 1
        case .north:
            newLocation.y += 1
        case .south:
            newLocation.y -= 1
        }
        
        return newLocation
    }
    
}
