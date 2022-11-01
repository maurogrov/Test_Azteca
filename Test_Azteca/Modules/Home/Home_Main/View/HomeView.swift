//
//  HomeView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit
import FirebaseFirestore

class HomeView: UIViewController, Storyboarded {
    
    var presenter: HomePresenterProtocol?
    @IBOutlet weak var UserTbl: UITableView!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //readData()
//        writeData()
        build()
    }
    
    
    func readData() {
        let docRef = db.document("ios/TestAzteca")
        
        docRef.addSnapshotListener { snapshot, error in
            
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            
            guard let isDinamic = data["dinamicBackground"] as? Bool else {
                return
            }
            print("this is the data, ", isDinamic)
            
        }
    }
    
    func writeData(){
        let docRef = db.document("ios/TestAzteca")
        docRef.setData(["text": "read image"])
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

