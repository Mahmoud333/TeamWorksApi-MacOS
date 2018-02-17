//
//  MAWindowController.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/15/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//some helpers: http://robin.github.io/cocoa/mac/2016/03/28/title-bar-and-toolbar-showcase/ & https://github.com/robin/TitlebarAndToolbar

import Cocoa

class MAWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.titlebarAppearsTransparent = true       // gives it "flat" look
        //window?.backgroundColor = mainColor         // set the background color
        
        
        window?.titleVisibility = .visible //or hidden
        //window?.styleMask = .fullSizeContentView
        window?.styleMask.insert(NSWindow.StyleMask.fullSizeContentView)
                
    
        self.window?.title = "TeamWorks"
    }
    
    

}
