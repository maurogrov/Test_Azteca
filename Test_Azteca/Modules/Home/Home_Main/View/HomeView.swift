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
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var loadSpiner: UIActivityIndicatorView!
    private var isLoading = false {
        didSet {
            loadSpiner.isHidden = !isLoading
            isLoading ?  loadSpiner.startAnimating() : loadSpiner.stopAnimating()
        }
    }
    internal var nameUser : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
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
    
    @IBAction func updateProfileBtnAction(_ sender: Any) {
        isLoading = true
        presenter?.updateProfile(name: nameUser)
    }
    
    func goToDetailPhoto(){
        //No MVP The VC is Simple
        let vc = PhotoView.instantiate(fromStoryboard: .Home)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func goToDetailStadistics(){
        presenter?.goTo(.Estadistics)
    }
}

extension HomeView : HomeViewProtocol {
    func finshLoad() {
        isLoading = false
    }
}
