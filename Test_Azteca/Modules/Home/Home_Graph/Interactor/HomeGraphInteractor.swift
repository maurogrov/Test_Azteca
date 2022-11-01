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
    
    
//    private var dataPokemons: [PokemonModel] = []
    
    func getData() {
//        remoteDataManager?.getDataPokemonService(lastIdItem, { pokemons in
//            self.presenter?.getListPokemon(list: pokemons)
//        })
    }
    
    
}

extension HomeGraphInteractor: HomeGraphRemoteDataManagerOutputProtocol {

}
