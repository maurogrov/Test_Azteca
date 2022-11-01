//
//  File.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? {get set}
//    func getListPokemon(list: [PokemonModel])
}

protocol HomeInteractorInputProtocol: AnyObject {
    //PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDataManager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDataManager: HomeRemoteDataManagerInputProtocol? { get set }
//    func getDataPokemon(_ lastIdItem: Int?)
}

protocol HomeRouterInputProtocol: AnyObject {
    //PRESENTER -> ROUTER
    func goToHomeGraph()
}

protocol HomePresenterProtocol: AnyObject {
    //VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? {get set}
    var wireFrame: HomeWireFrame? {get set}
    var router : HomeRouterInputProtocol? {get set}
    func viewDidLoad()
    func goTo(_ page : goToEnum)
    
}

protocol HomeInteractorOutputProtocol: AnyObject {
    //INTERACTOR -> PRESENTER
//    func getListPokemon(list: [PokemonModel])
}
protocol HomeRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
}
protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
//    func getDataPokemonService(_ lastIdItem: Int?, _ closure: @escaping ([PokemonModel]) -> Void)
    
}
protocol HomeLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
