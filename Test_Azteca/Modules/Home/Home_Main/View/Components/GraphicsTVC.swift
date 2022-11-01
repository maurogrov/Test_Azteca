//
//  GraphicsTVC.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation
import UIKit

class GraphicsTVC: UITableViewCell {
    
    static let id : String = "GraphicsTVC"

    var pressActionHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stadisticBtnAction(_ sender: Any) {
        pressActionHandler?()
    }
}
