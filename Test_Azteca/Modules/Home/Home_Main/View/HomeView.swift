//
//  HomeView.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit

class HomeView: UIViewController, Storyboarded {
    
    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

extension HomeView : HomeViewProtocol {
//    func getListPokemon(list: [PokemonModel]) {
//        isLoading = false
//
//        for element in list {
//            if let _ = dataList.first(where: {$0.id == element.id}){
//                continue
//            }
//            dataList.append(element)
//            let indexPath = IndexPath(row: dataList.count - 1, section: SectionsTbl.records.rawValue)
//            PokemonCV.insertItems(at: [indexPath])
//        }
//    }
     
}

