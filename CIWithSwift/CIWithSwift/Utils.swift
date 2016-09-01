//
//  Utils.swift
//  CIWithSwift
//
//  Created by Apple on 9/2/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import Foundation
import SpriteKit

extension CGPoint {
    func shift(dx : CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + dx, y: self.y + dy)
    }
}
