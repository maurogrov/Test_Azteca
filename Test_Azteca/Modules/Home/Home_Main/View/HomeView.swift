//
//  HomeView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class HomeView: UIViewController, Storyboarded {
    
    var presenter: HomePresenterProtocol?
    @IBOutlet weak var UserTbl: UITableView!
    
    let db = Firestore.firestore()
    
    private let storage = Storage.storage().reference()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        build()
        
        let UUID = getUUID()
//        getData(id: UUID)
//        writeData(id: UUID, name: "Mauricio Guerrero", url: <#T##String#>)
        readData(id: UUID)
        
    }
    
    func getUUID() -> String {
        if let uuid = UserDefaults.standard.string(forKey: "uuid"){
            return uuid
        }
        else{
            let uuid = UUID().uuidString
            UserDefaults.standard.set(uuid, forKey: "uuid")
            return uuid
        }
    }
    
    func getData(id uuid : String){
        
        
        if let data = UserDefaults.standard.object(forKey: "imageProfile") as? String{
            let imageData = Data(base64Encoded: data)
            let image = UIImage(data: imageData!)
            guard let pngData = image?.pngData() else {return}
            
            let ref = storage.child("images/\(uuid)/profileImage.png")
            ref.putData(pngData) { _, error in
                guard error == nil else {
                    print("Failed to upload")
                    return
                }
                
                self.storage.child("images/\(uuid)/profileImage.png").downloadURL { url, error in
                    
                    guard let url = url, error == nil else {return}
                    
                    let urlString = url.absoluteString
                    print("downolad URL: \(urlString)")
                    
                    self.writeData(id: uuid, name: "Mauricio Guerrero", url: urlString)
                    
                    
                }
            }
        }
        
    }
    
    
    func readData(id uuid : String) {
        let docRef = db.document("dataProfile/\(uuid)")
        docRef.addSnapshotListener { snapshot, error in
            
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            guard let urlStr = data["urlStr"] as? String, let name = data["name"] as? String else {
                return
            }
            print("this is the data profile, ", urlStr, name)
        }
    }
    
    func writeData(id uuid: String, name: String, url: String){
        let docRef = db.document("dataProfile/\(uuid)")
        docRef.setData(
            ["name": "\(name)", "urlStr" : "\(url)", ]
        )
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

