//
//  Home_GraphWireFrame.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation
import UIKit

class HomeGraphWireFrame {
    
    class func createHomeModule() -> UIViewController {
//
        let view = HomeGraphView.instantiate(fromStoryboard: .Home)
//
        let presenter : HomeGraphPresenterProtocol & HomeGraphInteractorOutputProtocol = HomeGraphPresenter()
        
        let interactor : HomeGraphInteractorInputProtocol & HomeGraphRemoteDataManagerOutputProtocol = HomeGraphInteractor()
    
        let remoteDataManager: HomeGraphRemoteDataManagerInputProtocol = HomeGraphRemoteDataManager()
        
        let wireFrame : HomeGraphWireFrame = HomeGraphWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager

        return view
//
    }
}
