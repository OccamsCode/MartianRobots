//
//  Locomotion.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation

class Locomotion {
    
    let environment: Environment
    var object: Movable
    
    init(on object: Movable, in environment: Environment) {
        self.environment = environment
        self.object = object
    }
    
    func moveForward() -> Point {
        
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
    
    func turnLeft() -> Direction {
        
        switch object.direction {
        case .north: return .west
        case .west: return .south
        case .south: return .east
        case .east: return .north
        }
        
    }
    
    func turnRight() -> Direction {
        
        switch object.direction {
        case .north: return .east
        case .west: return .north
        case .south: return .west
        case .east: return .south
        }
        
    }
    
    func execute(_ commands: [Command]) {
        
        for command in commands {
            
            switch command {
            case .forward:
                
                let newLocation = moveForward()
                
                if !environment.exists(newLocation) {
                    
                    if environment.containsScent(at: object.location, heading: object.direction) {
                        continue
                    } else {
                        
                        environment.addScent(at: object.location, heading: object.direction)
                        object.currentStatus = .lost
                        return
                    }
                    
                } else {
                    object.location = newLocation
                }
                
            case .left:
                
                let newHeading = turnLeft()
                object.direction = newHeading
                
            case .right:
                
                let newHeading = turnRight()
                object.direction = newHeading
            }
            
        }
        
    }
}
