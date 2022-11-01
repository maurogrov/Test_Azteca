//
//  HomeGraphView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation
import UIKit

class HomeGraphView: UIViewController, Storyboarded {
    
    @IBOutlet weak var spinerAct: UIActivityIndicatorView!
    @IBOutlet weak var graphTbl: UITableView!
    
    var presenter : HomeGraphPresenterProtocol?
    var isLoading : Bool = false {
        didSet{
            spinerAct.isHidden = !isLoading
            if isLoading {
                spinerAct.startAnimating()
            }
            else {
                spinerAct.stopAnimating()
            }
        }
    }
    var dataGraph : [GraphicModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = true
        self.buildViews()
        presenter?.viewDidLoad()
    }
    
    func buildViews(){
        graphTbl.delegate = self
        graphTbl.dataSource = self
        
        let graphicsCell = UINib(nibName: GraphTVC.id, bundle: nil)
        graphTbl.register(graphicsCell, forCellReuseIdentifier: GraphTVC.id)
        
    }
}

extension HomeGraphView : HomeGraphViewProtocols {
    
    func getListGraphics(list: [GraphicModel]) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.dataGraph = list
            self.graphTbl.reloadData()
        }
        
    }
    
    
}

