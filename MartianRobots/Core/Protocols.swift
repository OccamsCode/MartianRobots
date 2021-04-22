//
//  Protocols.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation

protocol Movable {
    
    var location: Point { get set }
    var direction: Direction { get set }
    
    init(_ origin: Point, heading: Direction)
}

protocol Environment {
    
    var size: Rect { get }
    
    init(_ origin: Point, width: Int, height: Int)
    
    func exists(_ location: Point) -> Bool
    
}
