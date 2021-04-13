//
//  GameState.swift
//  RPS
//
//  Created by Yan Akhrameev on 02/04/21.
//

import Foundation
enum GameState{
    case inicio
    case vitoria
    case derrota
    case empate
    
    var mensagem: String {
        switch self {
        case .inicio:
            return "Papel, Pedra ou Tesoura"
        case .vitoria:
            return "Parabéns! Você Ganhou!"
        case .derrota:
            return "Sentimos. Você Perdeu!"
        case .empate:
            return "Empate! Tente Novamente!"
        }
    }
}
