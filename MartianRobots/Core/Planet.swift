//
//  Planet.swift
//  MartianRobots
//
//  Created by Brian Munjoma on 22/04/2021.
//

import Foundation
import CoreGraphics

class Planet: Environment {
    
    let size: CGRect
    
    required init(_ origin: CGPoint, width: Int, height: Int) {
        self.size = CGRect(origin: origin, size: CGSize(width: width, height: height))
    }
    
    func exists(_ location: CGPoint) -> Bool {

        let frame = CGRect(origin: size.origin, size: CGSize(width: location.x, height: location.y))
        return size.contains(frame)
    }
    
}
