//
//  ViewController.swift
//  Loteria
//
//  Created by Lucas Inocencio on 18/11/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import Foundation

enum GameType: String {
    case megaSena = "Mega-Sena"
    case quina = "Quina"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    return result.sorted()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showNumbers(for type: GameType) {
        lbGameType.text = type.rawValue
        var game: [Int] = []
            switch type {
                case .megaSena:
                    game = 6>-<60
                    balls.last!.isHidden = false
                case .quina:
                    game = 5>-<80
                    balls.last!.isHidden = true
            }
        for (index, game) in game.enumerated() {
            balls[index].setTitle("\(game)", for: .normal)
        }
    }

    @IBAction func btGenerateGame() {
        switch scGameType.selectedSegmentIndex {
            case 0:
                showNumbers(for: .megaSena)
            default :
                showNumbers(for: .quina)
        }
    }

}

