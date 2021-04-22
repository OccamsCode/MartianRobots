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
    var currentStatus: Status { get set }
    
    init(_ origin: Point, heading: Direction, currentStatus: Status)
}

typealias Scents = [Point: [Direction]]

protocol Environment {
    
    var size: Rect { get }
    var scents: Scents { get set }
    init(_ origin: Point, width: Int, height: Int, scents: Scents)
    
    func exists(_ location: Point) -> Bool
    
    func containsScent(at location: Point, heading: Direction) -> Bool
    func addScent(at location: Point, heading: Direction)
}
