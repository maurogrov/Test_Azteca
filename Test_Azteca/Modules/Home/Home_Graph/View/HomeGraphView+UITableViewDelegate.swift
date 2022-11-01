//
//  HomeGraphView+UITableViewDelegate.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import UIKit


extension HomeGraphView : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataGraph.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GraphTVC.id, for: indexPath) as! GraphTVC
        let model = self.dataGraph[indexPath.row]
        cell.setup(with: model)
        
        return cell
    }
    
    
    
    
}
