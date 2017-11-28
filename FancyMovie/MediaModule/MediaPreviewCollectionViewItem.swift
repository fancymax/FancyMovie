//
//  MediaPreviewCollectionViewItem.swift
//  FancyMovie
//
//  Created by fancymax on 27/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Cocoa

class MediaPreviewCollectionViewItem: NSCollectionViewItem {
    
    weak var resourceLoaderDelegate:ResourceLoaderDelegate?
    
    @IBOutlet weak var resouceImageView: NSImageView!
    @IBOutlet weak var resouceFileNameTextfield: NSTextField!
    
    var index:IndexPath = IndexPath() {
        didSet {
            if let image = self.resourceLoaderDelegate?.loadThumbByIndexPath(index) {
                resouceImageView.image = image
            }
            
            if let name = self.resourceLoaderDelegate?.loadNameByIndexPath(index) {
                resouceFileNameTextfield.stringValue = name
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("MediaPreviewCollectionViewItem")
    }
    
}
