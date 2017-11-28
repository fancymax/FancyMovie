//
//  MediaAppendCollectionViewItem.swift
//  FancyMovie
//
//  Created by fancymax on 27/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Cocoa

class MediaAppendCollectionViewItem: NSCollectionViewItem {
    
    weak var resourceLoaderDelegate:ResourceLoaderDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("MediaAppendCollectionViewItem")
    }
    
    @IBAction func clickAddMediaFiles(sender: AnyObject?) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = true
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        //        openPanel.allowedFileTypes = FSLoadSupportFileTypes.SupportFileTypes
        openPanel.beginSheetModal(for: self.view.window!) { (response) in
            if (response == NSApplication.ModalResponse.OK) {
                self.resourceLoaderDelegate?.loadMediaFiles(openPanel.urls)
            }
        }
    }
    
}
