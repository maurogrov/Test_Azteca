//
//  HomeView+UITableViewDelegate.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation
import UIKit


enum UserTblEnum: Int, CaseIterable {
    case name = 0
    case photo = 1
    case graphics = 2
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return UserTblEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let typeCell = UserTblEnum(rawValue: indexPath.section)
        
        switch typeCell {
        case .name:
            let cell = tableView.dequeueReusableCell(withIdentifier: NameTVC.id, for: indexPath) as! NameTVC
            return cell
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTVC.id, for: indexPath) as! PhotoTVC
            cell.pressActionHandler = { [weak self] () in
                guard self != nil else { return }
                
                self?.goToDetailPhoto()
            }
            return cell
        case .graphics:
            let cell = tableView.dequeueReusableCell(withIdentifier: GraphicsTVC.id, for: indexPath) as! GraphicsTVC
            return cell
        default:
            return UITableViewCell()
        }
        
        
        

        
    
    }
    
    
    
}
