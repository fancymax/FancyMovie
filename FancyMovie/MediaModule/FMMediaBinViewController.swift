//
//  FMMediaBinViewController.swift
//  FancyMovie
//
//  Created by fancymax on 21/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Cocoa

class FMMediaBinViewController: NSViewController {

    @IBOutlet weak var mediaCollectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerItemsForMediaCollectionView()
    }
    
    func registerItemsForMediaCollectionView() {
        mediaCollectionView.register(MediaAppendCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("MediaAppendCollectionViewItem"))
        mediaCollectionView.register(MediaPreviewCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("MediaPreviewCollectionViewItem"))
    }
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("FMMediaBinViewController")
    }
    
}

extension FMMediaBinViewController:NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        if indexPath.item == 0 {
            let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("MediaAppendCollectionViewItem"), for: indexPath)
            return item
        }
        else {
            let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("MediaPreviewCollectionViewItem"), for: indexPath)
            
            return item
        }
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
}

extension FMMediaBinViewController:NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSMakeSize(100, 100)
    }
    
}
