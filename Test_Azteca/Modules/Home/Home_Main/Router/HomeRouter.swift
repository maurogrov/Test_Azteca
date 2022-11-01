//
//  HomeRouter.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation
import UIKit


class HomeRouter {
    
}

extension HomeRouter: HomeRouterInputProtocol {
    
    func goToHomeGraph() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
            return
        }
        
        let vc = HomeGraphWireFrame.createHomeModule()
        let nc = sceneDelegate.window?.rootViewController as? UINavigationController
        nc?.navigationBar.isHidden = false
        nc?.pushViewController(vc, animated: true)
    }
}
