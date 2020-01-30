//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Stephanie Ballard on 1/30/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//
//Create a setTheme function. This should do the same thing as the setTheme method in your collection view controller, except that it should change the PhotoDetailViewController view's background color to match the themePreference background color property. Call this function each time the view loads.
//
//Create an updateViews function that takes the property values of the photo object (if it isn't nil) and sets them in the appropriate UI element. You will need to use the UIImage(data: Data) initializer to convert the photo's imageData to a UIImage. You can then put that UIImage in the image view. Call this function each time the view loads.
//
//The "Save" bar button item's action should either update the photo if it has a value, or create a new instance of photo using the methods in the photoController. "Pop" the view controller afterwards.
//
//The addImage action should present a UIImagePickerController that allows the user to select an image to add to the Photo object.
//
//Note: Unless you use an unwind, a segue always presents a new view controller each time it is called.
//Note: Make sure you request authorization to access the photo library, and add the "Privacy - Photo Library Usage Description" key-value pair to the info.plist.
//Note: Your PhotoDetailViewController will need to adopt both the UIImagePickerControllerDelegate and UINavigationControllerDelegate protocols and implement the didFinishPickingMediaWithInfo method to get the image the user selects, then dismiss the image picker.

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
