//
//  SideBarCell.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/14/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Cocoa

class SideBarCell: NSCollectionViewItem {

    @IBOutlet weak var tabtf: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Customize It
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        //1-
        self.view.layer?.cornerRadius = 2
        self.view.layer?.borderColor = NSColor.black.cgColor
        self.view.layer?.borderWidth = 3
        
        
        //Customize its subviews
        tabtf.textColor = NSColor.white
    }
    
    func selectIT() {
        //cell.view.layer?.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)//NSColor.lightGray.cgColor
        self.view.layer?.borderColor = NSColor.systemBlue.cgColor
    }
    
    func unselectIT() {
        self.view.layer?.borderColor = NSColor.black.cgColor

    }
    
}
