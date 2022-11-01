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
    
//    private func buildUrls(nextId: Int ) -> [URL]{
//        let askNumberRecords = 20
//
//        var urls: [URL] = []
//
//        for index in nextId...nextId + askNumberRecords - 1 {
//            let urlStr = "https://pokeapi.co/api/v2/pokemon/\(index)"
//            guard let url = URL(string: urlStr) else {continue}
//            urls.append(url)
//        }
//
//        return urls
//
//    }
    
}

extension HomeRemoteDataManager : HomeRemoteDataManagerInputProtocol{
    

}
