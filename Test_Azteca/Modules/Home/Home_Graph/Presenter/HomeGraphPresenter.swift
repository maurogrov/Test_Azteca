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
        interactor?.getData()
    }
    
}

extension HomeGraphPresenter: HomeGraphInteractorOutputProtocol {
    
    func getListDataGraph(list: [GraphicModel]) {
        view?.getListGraphics(list: list)
    }
}
