//
//  HomeInteractor.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation
import UIKit


class HomeInteractor : HomeInteractorInputProtocol{
   
    weak var presenter : HomeInteractorOutputProtocol?
    var localDataManager: HomeLocalDataManagerInputProtocol?
    var remoteDataManager: HomeRemoteDataManagerInputProtocol?
    
//    private var dataPokemons: [PokemonModel] = []
    
    func getDataPokemon(_ lastIdItem: Int?) {
        
//        remoteDataManager?.getDataPokemonService(lastIdItem, { pokemons in
//            self.presenter?.getListPokemon(list: pokemons)
//        })
        
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {

}
