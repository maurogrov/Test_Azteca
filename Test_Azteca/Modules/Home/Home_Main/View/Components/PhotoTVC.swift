//
//  PhotoTVC.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit
import FirebaseFirestore

class PhotoTVC: UITableViewCell {
    
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImageView: UIView!
    
    static let id : String = "PhotoTVC"
    var pressActionHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(){
        profileImageView.layer.masksToBounds = true
        profileImg.transform = self.profileImg.transform.rotated(by: CGFloat(Double.pi / 2))
        readData(id: getUUID())
       
    }
    
    func getUUID() -> String {
        if let uuid = UserDefaults.standard.string(forKey: "uuid"){
            return uuid
        }
        else{
            let uuid = UUID().uuidString
            UserDefaults.standard.set(uuid, forKey: "uuid")
            return uuid
        }
    }
    
    func readData(id uuid : String) {
        
        let db = Firestore.firestore()
        let docRef = db.document("dataProfile/\(uuid)")
        docRef.addSnapshotListener { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            guard let urlStr = data["urlStr"] as? String, let name = data["name"] as? String else {
                return
            }
            DispatchQueue.main.async {
                self.nameLbl.text = name
               
                self.profileImg.loadFrom(URLAddress: urlStr)
            }
        }
    }
    
    
    @IBAction func imageBtnAction(_ sender: Any) {
        pressActionHandler?()
        
    }
    
 
    

}
