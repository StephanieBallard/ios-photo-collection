//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Stephanie Ballard on 1/30/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

//Create a swift file called "PhotoController.swift".
//Create a class PhotoController.
//Add a photos varable of type [Photo], and set its initial value to an empty array.
//Add a "Create" method that initializes a new instance of Photo and appends it to the photos array.
//Add an "Update" method that takes in Photo,Data, and String parameters.

import Foundation

class PhotoController {
    var photos:[Photo] = []
    
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
            var scratch = photo
            scratch.imageData = imageData
            scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
        
    }
    
}


