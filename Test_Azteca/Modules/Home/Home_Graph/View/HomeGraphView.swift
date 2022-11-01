//
//  HomeGraphView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation
import UIKit

class HomeGraphView: UIViewController, Storyboarded {
    
    var presenter : HomeGraphPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeGraphView : HomeGraphViewProtocols {

}

