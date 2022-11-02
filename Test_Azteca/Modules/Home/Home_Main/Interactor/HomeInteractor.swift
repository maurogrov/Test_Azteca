//
//  HomeInteractor.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseFirestore


class HomeInteractor : HomeInteractorInputProtocol{
  
    weak var presenter : HomeInteractorOutputProtocol?
    var localDataManager: HomeLocalDataManagerInputProtocol?
    var remoteDataManager: HomeRemoteDataManagerInputProtocol?
    
    private let storage = Storage.storage().reference()

    
    func updateProfile(name: String) {
        let uuid = getUUID()
        let imgData = getDataImage()
        
        if imgData != nil {
            saveDataImage(id: uuid, imageData: imgData!) { strUrl in
                guard let strUrl = strUrl else {return}
                self.writeData(id: uuid, name: name, url: strUrl)
                self.presenter?.finishUpdateProfile()
            }
        }
        else {
            self.writeData(id: uuid, name: name, url: "")
            self.presenter?.finishUpdateProfile()
        }
        
    }
    
    private func getUUID() -> String {
        if let uuid = UserDefaults.standard.string(forKey: "uuid"){
            return uuid
        }
        else{
            let uuid = UUID().uuidString
            UserDefaults.standard.set(uuid, forKey: "uuid")
            return uuid
        }
    }
    
    private func writeData(id uuid: String, name: String, url: String){
        let db = Firestore.firestore()
        let docRef = db.document("dataProfile/\(uuid)")
        docRef.setData(
            ["name": "\(name)", "urlStr" : "\(url)", ]
        )
    }
    
    private func getDataImage() -> Data? {
        
        if let data = UserDefaults.standard.object(forKey: "imageProfile") as? String{
            let imageData = Data(base64Encoded: data)
            let image = UIImage(data: imageData!)
            
            if let pngData = image?.pngData(){
                return pngData
            }
        }
        return nil
        
    }
    
    private func saveDataImage(id uuid: String, imageData: Data, completionHandler: @escaping(String?) -> Void) {
        
        let ref = storage.child("images/\(uuid)/profileImage.png")
        ref.putData(imageData) { _, error in
            guard error == nil else {
                print("Failed to upload")
                completionHandler(nil)
                return
            }
            self.storage.child("images/\(uuid)/profileImage.png").downloadURL { url, error in
                guard let url = url, error == nil else {return}
                let urlString = url.absoluteString
                completionHandler(urlString)
            }
        }
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {

}
