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
import Photos //to access the user's photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTheme()
        
        // Do any additional setup after loading the view.
    }
    
    //need one source for a class, pass it around to the other files with var
    //if we dont ask permission app will crash, apple requires we ask permission to access the user's photo lib
    @IBAction func addPhoto(_ sender: UIButton) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else {
                    NSLog("User did not authorize access to photo library"); return
                }
                self.presentImagePickerController()
            }
        default:
            break
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
    }
    
    func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
        guard let image = imageView.image,
            let imageData = image.pngData(),
                let title = textField.text else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: photo.imageData, title: photo.title)
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
        //pop view to last controller and pop to root is to initial view controller
    }
    
    func updateViews() {
        guard let photo = photo else { return }

        imageView.image = UIImage(data: photo.imageData)
        textField.text = photo.title
        self.title = photo.title //switches to what the photo was named in the text field
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "dark":
            backgroundColor = .darkGray
        case "pink":
            backgroundColor = .systemPink
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
        
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
