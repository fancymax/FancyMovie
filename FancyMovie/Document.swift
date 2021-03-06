//
//  Document.swift
//  FancyMovie
//
//  Created by fancymax on 2017/11/15.
//  Copyright © 2017年 max. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var playerModule:FMPlayerViewController!
    var mediaModule:FMMediaBinViewController!
    var timelineModule:FMTimelineViewController!

    @IBOutlet weak var mediaBox: NSBox!
    @IBOutlet weak var playerBox: NSBox!
    @IBOutlet weak var timelineBox: NSBox!
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }
    
    
    
    override func windowControllerDidLoadNib(_ windowController: NSWindowController) {
        playerModule = FMPlayerViewController()
        playerBox.contentView = playerModule.view
        
        mediaModule = FMMediaBinViewController()
        mediaBox.contentView = mediaModule.view
        
        timelineModule = FMTimelineViewController()
        timelineBox.contentView = timelineModule.view
    }

    override var windowNibName: NSNib.Name? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return NSNib.Name("Document")
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

