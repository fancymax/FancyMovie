//
//  MediaAppendCollectionViewItem.swift
//  FancyMovie
//
//  Created by fancymax on 27/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Cocoa

class MediaAppendCollectionViewItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("MediaAppendCollectionViewItem")
    }
    
}
