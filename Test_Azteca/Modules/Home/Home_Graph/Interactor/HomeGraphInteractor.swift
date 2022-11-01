//
//  HomeGraphProtocols.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation


class HomeGraphInteractor : HomeGraphInteractorInputProtocol{
   
    weak var presenter : HomeGraphInteractorOutputProtocol?
    var remoteDataManager: HomeGraphRemoteDataManagerInputProtocol?
    
    
    private var dataGraph: [GraphicModel] = []
    
    func getData() {
        if dataGraph.count == 0 {
            remoteDataManager?.getDataGraph({ arrayData in
                self.dataGraph = arrayData
                self.presenter?.getListDataGraph(list: self.dataGraph)
            })
        }
        else {
            self.presenter?.getListDataGraph(list: self.dataGraph)
        }
    }
    
}

extension HomeGraphInteractor: HomeGraphRemoteDataManagerOutputProtocol {}
