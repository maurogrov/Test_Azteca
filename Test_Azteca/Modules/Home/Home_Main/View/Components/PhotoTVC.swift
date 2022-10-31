//
//  PhotoTVC.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit

class PhotoTVC: UITableViewCell {
    
    @IBOutlet weak var imageBtn: UIButton!
    static let id : String = "PhotoTVC"
    
    var pressActionHandler: (() -> Void)?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func imageBtnAction(_ sender: Any) {
        pressActionHandler?()
        
    }
    
 
    

}
