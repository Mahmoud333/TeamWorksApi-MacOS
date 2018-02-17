//
//  MACollectionView.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/15/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Cocoa

class MACollectionView: NSCollectionView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    
    override func setFrameSize(_ newSize: NSSize) {
        if newSize.width != self.collectionViewLayout?.collectionViewContentSize.width {
            var ourNewSize = newSize
            ourNewSize.width = self.collectionViewLayout!.collectionViewContentSize.width
            
            super.setFrameSize(ourNewSize)
        } else {
            
            super.setFrameSize(newSize)
        }
        //NSLog(@"setFrameSize%@", CGSizeCreateDictionaryRepresentation(newSize));
    }
    
}
