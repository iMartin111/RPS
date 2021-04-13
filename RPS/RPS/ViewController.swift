//
//  ViewController.swift
//  RPS
//
//  Created by Yan Akhrameev on 02/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    var estado: GameState = .inicio
    
    // MARK: - app life cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        atualizarInterfaceSegundo(estado)
        
    }
    
    // MARK: - outlets
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    @IBOutlet weak var appSignalLabel: UILabel!
    
    @IBOutlet weak var paperSignButton: UIButton!
    
    @IBOutlet weak var stoneSignButton: UIButton!
    
    @IBOutlet weak var sisorSignButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    //MARK: - actions
    
    @IBAction func paperSignButton(_ sender: UIButton) {
        jogar(.papel)
        viewDidLoad()
    }
    
    @IBAction func stoneSignButton(_ sender: UIButton) {
        jogar(.pedra)
        viewDidLoad()
    }
    
    @IBAction func sisorSignButton(_ sender: UIButton) {
        jogar(.tesoura)
        viewDidLoad()
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        atualizarInterfaceSegundo(.inicio)
        
    }
    
    //MARK: - methods
    
    func atualizarInterfaceSegundo( _ criterio: GameState ) {
        
        switch criterio {
        case .inicio:
            gameStateLabel.text = GameState.inicio.mensagem
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            appSignalLabel.text = "🎰"
            playAgainButton.isHidden = true
            paperSignButton.isHidden = false
            stoneSignButton.isHidden = false
            sisorSignButton.isHidden = false
            paperSignButton.isEnabled = true
            stoneSignButton.isEnabled = true
            sisorSignButton.isEnabled = true
        case .vitoria:
            gameStateLabel.text = GameState.vitoria.mensagem
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        case .derrota:
            gameStateLabel.text = GameState.derrota.mensagem
            view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .empate:
            gameStateLabel.text = GameState.empate.mensagem
            view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        
            
        }
    }
    
   func jogar(_ selecao: Sign){
        let adversario = randomSign()
        appSignalLabel.text = adversario.emoji
        estado = selecao.ganha(adversario)
        paperSignButton.isEnabled = false
        stoneSignButton.isEnabled = false
        sisorSignButton.isEnabled = false
        playAgainButton.isHidden = false
        if selecao == .papel {
            stoneSignButton.isHidden = true
            sisorSignButton.isHidden = true
        }
        if selecao == .pedra {
            paperSignButton.isHidden = true
            sisorSignButton.isHidden = true
        }
        if selecao == .tesoura {
            stoneSignButton.isHidden = true
            paperSignButton.isHidden = true
        }
    }

    
}

