//
//  HomeView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit

class HomeView: UIViewController, Storyboarded {
    
    var presenter: HomePresenterProtocol?
    @IBOutlet weak var UserTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        build()
    }
    
    func build(){
        UserTbl.delegate = self
        UserTbl.dataSource = self
        
        let nameCell = UINib(nibName: NameTVC.id, bundle: nil)
        UserTbl.register(nameCell, forCellReuseIdentifier: NameTVC.id)
        
        let photoCell = UINib(nibName: PhotoTVC.id, bundle: nil)
        UserTbl.register(photoCell, forCellReuseIdentifier: PhotoTVC.id)
        
        let graphicsCell = UINib(nibName: GraphicsTVC.id, bundle: nil)
        UserTbl.register(graphicsCell, forCellReuseIdentifier: GraphicsTVC.id)
        
    }

    //No MVP The VC is Simple
    func goToDetailPhoto(){
        
        let vc = PhotoView.instantiate(fromStoryboard: .Home)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func goToDetailStadistics(){
        presenter?.goTo(.Estadistics)
        
//        let vc = StadisticsView.instantiate(fromStoryboard: .Home)
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension HomeView : HomeViewProtocol {
     
}

