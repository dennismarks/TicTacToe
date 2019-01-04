//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Dennis M on 2018-04-25.
//  Copyright © 2018 Dennis M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                               [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var dict = [String:Any]()
    var dictScoreBoard = [String]()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent
//    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var currentPlayer: UILabel!
    @IBOutlet weak var reload: UIButton!
    @IBOutlet weak var roflanEbalo: UIImageView!
    @IBOutlet weak var win012: UIImageView!
    @IBOutlet weak var win345: UIImageView!
    @IBOutlet weak var win678: UIImageView!
    @IBOutlet weak var win036: UIImageView!
    @IBOutlet weak var win147: UIImageView!
    @IBOutlet weak var win258: UIImageView!
    @IBOutlet weak var win048: UIImageView!
    @IBOutlet weak var win246: UIImageView!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var scoreBoard: UILabel!
    
    @IBAction func action(_ sender: UIButton) {
        var someoneWon = false
        if gameState[sender.tag-1] == 0 && gameIsActive == true {
//            print(winningCombinations)

            if activePlayer == 1 {
                currentPlayer.text = "PLAYER TURN: O"
            }
            else{
                currentPlayer.text = "PLAYER TURN: X"
            }
            gameState[sender.tag-1] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "cross.jpg"), for: [])
                activePlayer = 2
            }
            else{
                sender.setImage(UIImage(named: "circle.jpg"), for: [])
                activePlayer = 1
            }
        }
        // check if the game is over
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 &&
            gameState[combination[0]] == gameState[combination[1]] &&
            gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                someoneWon = true
                currentPlayer.isHidden = true
                if gameState[combination[0]] == 1 {
                    label.text = "THE WINNER IS CROSS\nCONGRATS BRO"
                }
                else{
                    label.text = "THE WINNER IS NOUGHT\nCONGRATS BRO"
                }
                playAgainButton.isHidden = false
                label.isHidden = false
                roflanEbalo.isHidden = false
                reload.isHidden = true
                
                // clear the cross line
                let crossLine = dict[String(describing: combination)]!
                if String(describing: crossLine) == "win345" {
                    win345.isHidden = false
                }
                else if String(describing: crossLine) == "win012" {
                    win012.isHidden = false
                }
                else if String(describing: crossLine) == "win678" {
                    win678.isHidden = false
                }
                else if String(describing: crossLine) == "win036" {
                    win036.isHidden = false
                }
                else if String(describing: crossLine) == "win147" {
                    win147.isHidden = false
                }
                else if String(describing: crossLine) == "win258" {
                    win258.isHidden = false
                }
                else if String(describing: crossLine) == "win048" {
                    win048.isHidden = false
                }
                else if String(describing: crossLine) == "win246" {
                    win246.isHidden = false
                }
                b1.isUserInteractionEnabled = false
                b2.isUserInteractionEnabled = false
                b3.isUserInteractionEnabled = false
                b4.isUserInteractionEnabled = false
                b5.isUserInteractionEnabled = false
                b6.isUserInteractionEnabled = false
                b7.isUserInteractionEnabled = false
                b8.isUserInteractionEnabled = false
                b9.isUserInteractionEnabled = false
                
            }
        }
        gameIsActive = false
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false && someoneWon == false {
            currentPlayer.isHidden = true
            label.text = "DRAW FELLAS"
            label.isHidden = false
            playAgainButton.isHidden = false
            roflanEbalo.isHidden = false
            reload.isHidden = true
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        b1.isUserInteractionEnabled = true
        b2.isUserInteractionEnabled = true
        b3.isUserInteractionEnabled = true
        b4.isUserInteractionEnabled = true
        b5.isUserInteractionEnabled = true
        b6.isUserInteractionEnabled = true
        b7.isUserInteractionEnabled = true
        b8.isUserInteractionEnabled = true
        b9.isUserInteractionEnabled = true
        currentPlayer.text = "PLAYER TURN: X"
        currentPlayer.isHidden = false
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        label.isHidden = true
        roflanEbalo.isHidden = true
        reload.isHidden = false
        win012.isHidden = true
        win345.isHidden = true
        win678.isHidden = true
        win036.isHidden = true
        win147.isHidden = true
        win258.isHidden = true
        win048.isHidden = true
        win246.isHidden = true
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: [])
        }
    }
    @IBAction func pressReload(_ sender: UIButton) {
        playAgain(sender)
    }
    override func viewDidLoad()
    {
        playAgainButton.layer.cornerRadius = playAgainButton.frame.height / 2
        playAgainButton.layer.shadowColor = UIColor.white.cgColor
        playAgainButton.layer.shadowRadius = 3
        playAgainButton.layer.shadowOpacity = 0.5
        playAgainButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        currentPlayer.text = "PLAYER TURN: X"
        dict["[0, 1, 2]"] = "win012"
        dict["[3, 4, 5]"] = "win345"
        dict["[6, 7, 8]"] = "win678"
        dict["[0, 3, 6]"] = "win036"
        dict["[1, 4, 7]"] = "win147"
        dict["[2, 5, 8]"] = "win258"
        dict["[0, 4, 8]"] = "win048"
        dict["[2, 4, 6]"] = "win246"
        win012.layer.zPosition = 1
        win345.layer.zPosition = 1
        win678.layer.zPosition = 1
        win036.layer.zPosition = 1
        win147.layer.zPosition = 1
        win258.layer.zPosition = 1
        win048.layer.zPosition = 1
        win246.layer.zPosition = 1
        }
    }










