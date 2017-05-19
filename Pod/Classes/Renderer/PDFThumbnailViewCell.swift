//
//  PDFThumbnailViewCell.swift
//  Pods
//
//  Created by Chris Anderson on 11/14/16.
//
//

import UIKit

class PDFThumbnailViewCell: UICollectionViewCell {
    
    var pageThumbnail: PDFThumbnailView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.lightGray
    }
    
    func configure(document: PDFDocument, page: Int) {
        pageThumbnail?.removeFromSuperview()
        pageThumbnail = PDFThumbnailView(frame: CGRect(x: 1,
                                                       y: 1,
                                                       width: self.frame.width - 2,
                                                       height: self.frame.height - 2),
                                         document: document,
                                         page: page)
        
        
        let image = UIImage.bundledImage("bookmarkred")
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.addSubview(pageThumbnail!)
        if document.bookmarks.contains(page) {
            self.addSubview(imageView)
        }
    }
    
    override open func prepareForReuse() {
        pageThumbnail?.removeFromSuperview()
        pageThumbnail = nil
    }
}
