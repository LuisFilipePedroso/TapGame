//
//  Difficulty.swift
//  TapGame
//
//  Created by Luis Filipe Pedroso on 21/05/25.
//

import Foundation

enum Difficulty: Double {
    case easy = 1, medium = 0.5, hard = 0.1
    
    var title: String {
        switch self {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
}
