//
//  GraphTVC.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import UIKit

class GraphTVC: UITableViewCell {
    
    static let id : String = "GraphTVC"
    
    @IBOutlet weak var questionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(with data: GraphicModel){
        
        questionLbl.text = data.pregunta
        
//        cardView.layer.cornerRadius = 20
//        cardView.layer.borderWidth = 3
//        cardView.layer.borderColor = UIColor.black.cgColor
//        cardView.layer.masksToBounds = true
        
//        nameLbl.layer.backgroundColor = UIColor.white.cgColor
//        nameLbl.layer.cornerRadius = 15
//        nameLbl.layer.borderWidth = 1
//        nameLbl.layer.borderColor = UIColor.gray.cgColor
        
//        imageView.loadGradient(colors: [.gray, .white, .white])
        
//        nameLbl?.text = data.name.capitalized
        
        
      
    }

}
