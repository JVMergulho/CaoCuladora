//
//  sizes.swift
//  CaoCuladora
//
//  Created by João Vitor Lima Mergulhão on 10/05/24.
//

import Foundation

enum Size: String, CaseIterable{
    case small = "pequeno"
    case medium = "médio"
    case big = "grande"
    
    func convertAge(years: Int, months: Int) -> Int {
        let result: Int
        
        let multiplier: Int
        
        switch self {
        case .small:
            multiplier = 6
        case .medium:
            multiplier = 7
        case .big:
            multiplier = 8
        }
        
        result = years * multiplier + (months * multiplier)/12
        
        return result
    }
}
