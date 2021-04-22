//
//  Models.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation

enum Direction: CaseIterable {
    case north
    case east
    case south
    case west
}

enum Command {
    case forward
    case right
    case left
}

enum Status {
    case ok
    case lost
}

struct Point: Hashable {
    var x: Int
    var y: Int
    
    static let zero = Point(x: 0, y: 0)
}

struct Size {
    var width: Int
    var height: Int
}

struct Rect {
    var origin: Point
    var size: Size
    
    var width: Int { return size.width }
    
    var height: Int { return size.height }
    
    init(_ origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(_ origin: Point, width: Int, height: Int) {
        self.origin = origin
        self.size = Size(width: width, height: height)
    }
    
    func contains(_ point: Point) -> Bool {
        
        /*
         origin.x <= point.x <= size.width
         origin.y <= point.y <= size.height
         */
        
        return (origin.x...size.width).contains(point.x) && (origin.y...size.height).contains(point.y)
        
    }
}
