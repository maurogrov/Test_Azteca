//
//  PhotoView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit

class PhotoView: UIViewController, Storyboarded {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var openCameraBtn: UIButton!
    @IBOutlet weak var imageImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        build()
        buildViews()
    }
    
    func build() {
        if let data = UserDefaults.standard.data(forKey: "imageProfile"){
            openCameraBtn.setTitle("Change Photo", for: .normal)
            let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
            let image = UIImage(data: decoded)
            imageImg.image = image
                        
        }
        else {
            openCameraBtn.setTitle("New Photo", for: .normal)
        }
    }
    
    func buildViews() {
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func openBtnAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
}

extension PhotoView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        picker.dismiss(animated: true) {
            self.imageImg.image = image
            guard let data = image.jpegData(compressionQuality: 0.5) else {
                print("error")
                return
            }
            let encoded = try! PropertyListEncoder().encode(data)
            UserDefaults.standard.set(encoded, forKey: "imageProfile")
            self.openCameraBtn.setTitle("Change Photo", for: .normal)
        }
    }
    
}
