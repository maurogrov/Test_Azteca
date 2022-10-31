//
//  UIViewController+Storyboard.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 31/10/22.
//

import UIKit

enum StoryBoardEnum: String {
    case Home = "HomeStoryBoard"
    
}

protocol Storyboarded {
    static func instantiate(fromStoryboard storyboardName: StoryBoardEnum) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(fromStoryboard storyboardName: StoryBoardEnum) -> Self {
        let fullName = NSStringFromClass(self)

        let className = fullName.components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}


