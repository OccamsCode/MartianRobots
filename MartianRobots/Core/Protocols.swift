//
//  Protocols.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation
import CoreGraphics

protocol Movable {
    
    var location: CGPoint { get set }
    var direction: Direction { get set }
    
    init(_ origin: CGPoint, heading: Direction)
}

protocol Environment {
    
    var size: CGRect { get }
    
    init(_ origin: CGPoint, width: Int, height: Int)
    
    func exists(_ location: CGPoint) -> Bool
    
}
