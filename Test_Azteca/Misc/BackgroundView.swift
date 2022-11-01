//
//  BackGroundView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import UIKit
import FirebaseFirestore

class BackgroundView: UIView {
    
    let db = Firestore.firestore()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        readDataBackground()
    }
    
    func readDataBackground() {
        let docRef = db.document("ios/BackgroundDinamic")
        docRef.addSnapshotListener { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            print(data)
            guard let isDinamic = data["isDinamicBackground"] as? Bool,
                  let red = data["red"] as? Int,
                  let green = data["green"] as? Int,
                  let blue = data["blue"] as? Int
            else {
                print("Error")
                return
            }
            print(isDinamic)
            if isDinamic, red <= 255, green <= 255, blue <= 255 {
                self?.backgroundColor = UIColor(red: red, green: green, blue: blue)
                
                
            }else {
                self?.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
            }
        }
    }
}
