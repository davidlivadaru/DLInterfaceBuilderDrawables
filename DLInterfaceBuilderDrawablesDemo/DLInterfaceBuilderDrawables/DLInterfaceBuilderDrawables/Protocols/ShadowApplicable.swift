//
//  ShadowApplicable.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

import UIKit
import CoreGraphics
import QuartzCore

public protocol ShadowApplicable : DrawableType {
    var shadowApplied: Bool { get set }
    var shadowColorName: String { get }
    var shadowOpacity: Float { get set }
    var shadowOffsetPoint: CGPoint { get set }
    var shadowRadius: CGFloat { get set }
    
    func applyShadow()
}

extension ShadowApplicable where Self : UIView {
    public func applyShadow() {
        if shadowApplied {
            if let shadowColor: UIColor = convert(fromString: shadowColorName) {
                layer.shadowColor = shadowColor.CGColor
            }
            layer.shadowOpacity = Self.opacity(from: shadowOpacity)
            layer.shadowOffset = CGSize(width: shadowOffsetPoint.x, height: shadowOffsetPoint.y)
            layer.shadowRadius = shadowRadius
        }
    }
}
