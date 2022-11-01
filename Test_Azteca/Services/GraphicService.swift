//
//  GraphicService.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation

//CRUD SERVICE
class GraphicService {
    
    //Read
    static func downloadData(url: URL, completionData: @escaping ([GraphicModel]?) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                if let error = error {
                    print("Error en la operación \(error), NT001")
                }
                //                completionData(nil)
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(DataGraphic.self, from: data)
                    completionData(object.data)
                }
                catch let error {
                    print("Ha ocurrido un error: \(error.localizedDescription), NT001")
                    completionData(nil)
                }
            } else {
                print("Error \(response.statusCode), NT001")
                completionData(nil)
            }
        }.resume()
    }
    
    
    
    
}
