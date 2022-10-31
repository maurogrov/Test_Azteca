//
//  HomePresenter.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation

class HomePresenter {
    
    //towards
    weak var view: HomeViewProtocol?
    var wireFrame: HomeWireFrame?
    var interactor: HomeInteractorInputProtocol?
    
    
}

extension HomePresenter: HomePresenterProtocol {
 
    func viewDidLoad() {
//        interactor?.getDataPokemon(nil)
    }
    
    func feedData(lastIdItem: Int) {
//        interactor?.getDataPokemon(lastIdItem)
    }
    
   
}

extension HomePresenter: HomeInteractorOutputProtocol {
//    func getListPokemon(list: [PokemonModel]) {
//        view?.getListPokemon(list: list)
//    }
    
}
