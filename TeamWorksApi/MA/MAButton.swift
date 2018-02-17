//
//  MAButton.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/13/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Cocoa

@IBDesignable
class MAButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
    }
    //Font
    var ourAlignment: NSTextAlignment = .center
    @IBInspectable var fontAlignment: String = "center" {
        didSet {
            switch fontAlignment {
            case "center":
                ourAlignment = .center  ; setUpFont()
            case "right":
                ourAlignment = .right   ; setUpFont()
            case "left":
                ourAlignment = .left    ; setUpFont()
            default:
                break
            }
        }
    }
    //Font Names
    //https://gist.github.com/steakknife/6de319009539e71603bb
    @IBInspectable var fontName: String = "AvenirNext-Medium" {
        didSet {
            setUpFont()
        }
    }
    @IBInspectable var fontSize: CGFloat = 16.0 {
        didSet {
            setUpFont()
        }
    }
    @IBInspectable var fontColor: NSColor = NSColor.black {
        didSet {
            setUpFont()
        }
    }

    //Customize
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.wantsLayer = true
            self.layer?.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var BGColor: NSColor = NSColor.white {
        didSet {
            self.wantsLayer = true
            self.layer?.backgroundColor = BGColor.cgColor
        }
    }
    
    //Border
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.wantsLayer = true
            self.layer?.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: NSColor = NSColor.white {
        didSet {
            self.wantsLayer = true
            self.layer?.borderWidth = borderWidth
        }
    }
    
    func setUpFont(){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = ourAlignment
        
        self.attributedTitle = NSAttributedString(string: self.title, attributes: [NSAttributedStringKey.foregroundColor: fontColor,                                                                                     NSAttributedStringKey.paragraphStyle: paragraphStyle,
            NSAttributedStringKey.font: NSFont(name: fontName, size: fontSize)!])
    }
    
    func styleButtonText(button: NSButton, buttonName: String, fontColor: NSColor, alignment: NSTextAlignment, font: String, size: CGFloat){
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        
        button.attributedTitle = NSAttributedString(string: buttonName, attributes: [NSAttributedStringKey.foregroundColor: fontColor,                                                                                     NSAttributedStringKey.paragraphStyle: paragraphStyle,
            NSAttributedStringKey.font: NSFont(name: font, size: size)!])
        
    }
    
}
