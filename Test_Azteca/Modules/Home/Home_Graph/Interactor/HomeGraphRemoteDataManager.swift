//
//  HomeGraphRemoteDataManager.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation

class HomeGraphRemoteDataManager {
    
    weak var presenter: HomeInteractorOutputProtocol?
    
}

extension HomeGraphRemoteDataManager : HomeGraphRemoteDataManagerInputProtocol{
    
    
    func getDataGraph(_ closure: @escaping ([GraphicModel]) -> Void) {
        
        var dataGraph: [GraphicModel] = []
        
        let urlStr = "https://s3.amazonaws.com/dev.reports.files/test.json"
        guard let url = URL(string: urlStr) else {return }
        
        GraphicService.downloadData(url: url) { dataService in
            if dataService != nil {
                dataGraph = dataService!
            }
            closure(dataGraph)
        }
    }
}
