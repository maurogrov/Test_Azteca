//
//  HomeGraphProtocols.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation

protocol HomeGraphViewProtocols: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomeGraphPresenterProtocol? {get set}
    func getListGraphics(list: [GraphicModel])
}

protocol HomeGraphPresenterProtocol: AnyObject {
    //VIEW -> PRESENTER
    var view: HomeGraphViewProtocols? { get set }
    var interactor: HomeGraphInteractorInputProtocol? {get set}
    var wireFrame: HomeGraphWireFrame? {get set}
    func viewDidLoad()
    
}


protocol HomeGraphInteractorInputProtocol: AnyObject {
    //PRESENTER -> INTERACTOR
    var presenter: HomeGraphInteractorOutputProtocol? { get set }
    var remoteDataManager: HomeGraphRemoteDataManagerInputProtocol? { get set }
    func getData()
}

protocol HomeGraphInteractorOutputProtocol: AnyObject {
    //INTERACTOR -> PRESENTER
    func getListDataGraph(list: [GraphicModel])
}
protocol HomeGraphRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
}
protocol HomeGraphRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    func getDataGraph(_ closure: @escaping ([GraphicModel]) -> Void)
    
}

