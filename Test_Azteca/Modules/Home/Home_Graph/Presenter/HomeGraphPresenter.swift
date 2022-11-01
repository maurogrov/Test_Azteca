//
//  HomeGraphPresenter.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation


class HomeGraphPresenter {
    
    //towards
    weak var view: HomeGraphViewProtocols?
    var wireFrame: HomeGraphWireFrame?
    var interactor: HomeGraphInteractorInputProtocol?
    
}

extension HomeGraphPresenter: HomeGraphPresenterProtocol {
    
    func viewDidLoad() {
        print("did load successful")
//        interactor?.getDataPokemon(nil)
    }
    
}

extension HomeGraphPresenter: HomeGraphInteractorOutputProtocol {
    //    func getListPokemon(list: [PokemonModel]) {
    //        view?.getListPokemon(list: list)
    //    }
    
}
