//
//  TableVCell.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/15/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Cocoa

class TableVCell: NSTableCellView {
    @IBOutlet weak var taskImageV: NSImageView!
    @IBOutlet weak var taskTitleTF: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.white.cgColor
        self.taskTitleTF.textColor = NSColor.black
    }
    
}
