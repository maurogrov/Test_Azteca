//
//  HomeRemoteDataManager.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation

class HomeRemoteDataManager {
    
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
}

extension HomeRemoteDataManager : HomeRemoteDataManagerInputProtocol{
    

}
