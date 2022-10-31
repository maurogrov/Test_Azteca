//
//  HomeWireFrame.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit

class HomeWireFrame {
    
    class func createHomeModule() -> UIViewController {
        
        let view = HomeView.instantiate(fromStoryboard: .Home)
        
        let presenter : HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor : HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        let wireFrame : HomeWireFrame = HomeWireFrame()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        
        
        return view
        
    }
}

