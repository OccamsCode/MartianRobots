//
//  Planet.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation

class Planet: Environment {
    
    let size: Rect
    
    required init(_ origin: Point, width: Int, height: Int) {
        self.size = Rect(origin, size: Size(width: width, height: height))
    }
    
    func exists(_ location: Point) -> Bool {
        return size.contains(location)
    }
    
}
