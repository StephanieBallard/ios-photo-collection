//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Stephanie Ballard on 1/30/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

//Create an updateViews() function. You should be familiar with this function.
//Add a didSet property observer to the photo variable. Call updateViews inside of it.

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }

        imageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var photoLabel: UILabel!
    
    
}
