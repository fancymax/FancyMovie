//
//  FMPlayerbackView.swift
//  FancyMovie
//
//  Created by fancymax on 23/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Cocoa

class FMPlayerbackView: NSView {
    let color = NSColor.black

    override func draw(_ dirtyRect: NSRect) {
        color.set()
        NSBezierPath(rect: dirtyRect).fill()
    }
    

}
