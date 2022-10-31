//
//  nameTVC.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit

class NameTVC: UITableViewCell {
    
    static let id : String = "NameTVC"
    @IBOutlet weak var NameTxt: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func changeEventNameTxt(_ textField: UITextField) {
        
        if let str = textField.text, str != "" {
            
            let lastChart = String(str.last!)
            let characterSet = CharacterSet(charactersIn: lastChart)
            let allowedLetters = CharacterSet.letters
            let allowedSpaces = CharacterSet.whitespaces
            
            if !allowedLetters.isSuperset(of: characterSet), !allowedSpaces.isSuperset(of: characterSet) {
                NameTxt.text = String(str.dropLast())
            }
        }
    }
   
}
