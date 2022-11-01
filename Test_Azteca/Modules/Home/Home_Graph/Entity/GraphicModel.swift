//
//  GraphicModel.swift
//  Test_Azteca
//
//  Created by Mauricio Guerrero on 01/11/22.
//

import Foundation

// MARK: - DataGraphic
struct DataGraphic: Codable {
    let data: [GraphicModel]
}

// MARK: - Datum
struct GraphicModel: Codable {
    let pregunta: String
    let values: [Value]
}

// MARK: - Value
struct Value: Codable {
    let label: String
    let value: Int
}
