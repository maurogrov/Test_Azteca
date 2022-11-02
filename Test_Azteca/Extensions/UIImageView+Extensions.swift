//
//  UIImageView+Extensions.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 02/11/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
        
        guard let url = URL(string: URLAddress) else {
           
            return
        }
        
        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
}
