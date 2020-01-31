//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Stephanie Ballard on 1/30/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        //only for writing collection view in code only
        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    //Implement the prepareForSegue. You should have three segues to handle.
    
    //The segue from the cell should pass the themeHelper, photoController, and the photo.
    //The segue from the "Add" bar button item should pass the the themeHelper and the photoController.
    //The segue from the "Select Theme" bar button item should pass the themeHelper.
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }
    
    //Create a function called setTheme(). This function should:
    //Get the current themePreference from the themeHelper. Make sure that it has a value, or return out of the function.
    //Based on the value, change the collection view's background color depending on whether the theme is dark or the other color you selected.
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "dark":
            backgroundColor = .darkGray
        case "pink":
            backgroundColor = .systemPink
        default:
            break
        }
        
        collectionView.backgroundColor = backgroundColor
        
    }
    
    
}

