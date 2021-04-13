//
//  Sign.swift
//  RPS
//
//  Created by Yan Akhrameev on 02/04/21.
//

import Foundation
import GameplayKit

let randomChoise = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoise.nextInt()
    if sign == 0 {
        return .papel
    } else if sign == 1 {
        return .pedra
    } else {
        return .tesoura
    }
}

enum Sign {
    case papel
    case pedra
    case tesoura
    
    var emoji: String {
        switch self {
        case .papel:
            return "✋"
        case .pedra:
            return "👊"
        case .tesoura:
            return "✌️"
        }
    }
    
    func ganha(_ adversario: Sign) -> GameState{
        if self.emoji == "✋" && adversario.emoji == "👊" || self.emoji == "👊" && adversario.emoji == "✌️" || self.emoji == "✌️" && adversario.emoji == "✋" {
            return .vitoria
        }
        else if self.emoji == "✋" && adversario.emoji == "✌️" || self.emoji == "👊" && adversario.emoji == "✋" || self.emoji == "✌️" && adversario.emoji == "👊" {
            return .derrota
        }
        else if self.emoji == adversario.emoji {
            return .empate
        }
        else {
            return .inicio
        }
    }
    

    
    
}
