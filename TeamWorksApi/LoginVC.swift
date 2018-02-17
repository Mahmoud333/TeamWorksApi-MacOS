//
//  ViewController.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/13/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Cocoa
import CustomSegue

class LoginVC: NSViewController {

    @IBOutlet weak var containerView: NSView!
    
    @IBOutlet weak var accountTF: NSTextField!
    @IBOutlet weak var passwordTF: NSTextField!
    @IBOutlet weak var loginBtn: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        containerView.wantsLayer = true
        containerView.layer?.backgroundColor = #colorLiteral(red: 0.2127290964, green: 0.268209815, blue: 0.374376744, alpha: 1)
        //containerView.layer!.backgroundColor = //NSColor.black.cgColor
        

        AuthenticateService.instance.AuthenticateAccount()
    }

    @IBAction func logginClicked(_ sender: Any) {
        performSegue(withIdentifier: NSStoryboardSegue.Identifier(rawValue: "Testing"), sender: nil)
        
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier!.rawValue == "Testing" {
            if let segue = segue as? ReplaceWindowContentSegue, let dvc = segue.destinationController as? ActivityVC {
                
                
            }
        }
    }
    

    
}

