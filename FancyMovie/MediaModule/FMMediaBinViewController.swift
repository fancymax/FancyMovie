//
//  FMMediaBinViewController.swift
//  FancyMovie
//
//  Created by fancymax on 21/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Cocoa
import AVFoundation

protocol ResourceLoaderDelegate:class {
    func loadMediaFiles(_ urls:[URL])
    func loadThumbByIndexPath(_ index:IndexPath) -> NSImage?
    func loadNameByIndexPath(_ index:IndexPath) -> String
}

class FMMediaBinViewController: NSViewController {

    @IBOutlet weak var mediaCollectionView: NSCollectionView!
    
    private var assets:[AVAsset] = [AVAsset]()
    private var meidaURLs:[URL] = [URL]()
    
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

extension FMMediaBinViewController:ResourceLoaderDelegate {
    func loadMediaFiles(_ urls: [URL]) {
        let count = assets.count
        var indexPathSet = Set<IndexPath>()
        for i in 0..<urls.count {
            assets.append(AVAsset(url: urls[i]))
            meidaURLs.append(urls[i])
            indexPathSet.insert(IndexPath(item: count + i, section: 1))
        }
        
        mediaCollectionView.reloadItems(at: indexPathSet)
    }
    
    func loadThumbByIndexPath(_ index:IndexPath) -> NSImage? {
        let asset = assets[index.item - 1]
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        let time = CMTime(seconds: 10, preferredTimescale: 1)
        var actualTime = CMTime()
        if let image = try? imageGenerator.copyCGImage(at: time, actualTime: &actualTime) {
            return NSImage(cgImage: image, size: NSMakeSize(160, 90))
        }
        else {
            return nil
        }
    }
    
    func loadNameByIndexPath(_ index: IndexPath) -> String {
        let url = meidaURLs[index.item - 1]
        
        return url.lastPathComponent
    }

}



extension FMMediaBinViewController:NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        var item = NSCollectionViewItem()
        if indexPath.item == 0 {
            if let mediaAppendItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("MediaAppendCollectionViewItem"), for: indexPath) as? MediaAppendCollectionViewItem {
                mediaAppendItem.resourceLoaderDelegate = self
                item = mediaAppendItem
            }
        }
        else {
            if let mediaItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("MediaPreviewCollectionViewItem"), for: indexPath) as? MediaPreviewCollectionViewItem {
                mediaItem.resourceLoaderDelegate = self
                mediaItem.index = indexPath
                item = mediaItem
            }
        }
        return item
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count + 1
    }
}

extension FMMediaBinViewController:NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSMakeSize(100, 100)
    }
    
}
