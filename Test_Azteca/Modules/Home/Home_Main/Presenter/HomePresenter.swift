//
//  HomePresenter.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation


enum goToEnum {
    case Estadistics
}

class HomePresenter {
    
    //towards
    weak var view: HomeViewProtocol?
    var wireFrame: HomeWireFrame?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterInputProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
 
    func viewDidLoad() {
//        interactor?.getDataPokemon(nil)
    }
    
    func updateProfile(name: String) {
        interactor?.updateProfile(name: name)
    }
    
    func goTo(_ page : goToEnum) {
        switch page {
        case .Estadistics:
            router?.goToHomeGraph()
        }
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func finishUpdateProfile() {
        view?.finshLoad()
    }
    
}
