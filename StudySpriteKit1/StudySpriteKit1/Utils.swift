//
//  Utils.swift
//  StudySpriteKit1
//
//  Created by Apple on 8/31/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import Foundation

import SpriteKit

extension CGPoint {
    func distanceFrom(other: CGPoint) -> CGFloat {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}