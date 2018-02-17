//
//  MAProgressV.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/16/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Cocoa

class MAProgressV: NSView {

    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        //View
        wantsLayer = true
        layer?.backgroundColor = NSColor(white: 0.3, alpha: 0.5).cgColor

        //Progress
        progressIndicator.startAnimation(nil)
        
    
    }
    //So we can block the clicks to reach the under view
    override func mouseDown(with event: NSEvent) {}
    override func mouseUp(with event: NSEvent) {}
    override func mouseDragged(with event: NSEvent) {}
    override func mouseMoved(with event: NSEvent) {}
}
