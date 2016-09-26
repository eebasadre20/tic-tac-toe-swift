//
//  ViewController.swift
//  Tic-tac-toe
//
//  Created by Piktochart-Edsil on 9/26/16.
//  Copyright © 2016 eebasadre.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1 = noughts, 2 = crosses
    var activePlayer = 1
    var boardState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombination = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [2,4,6],
        [0,4,8]
    ]
    
    var gameActive = true
    
    

    @IBOutlet weak var btnMsg: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var playAgainbtn: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
        boardState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        gameActive = true
        
        btnMsg.hidden = false
        btnMsg.center = CGPointMake(btnMsg.center.x - 500, btnMsg.center.y)
        
        playAgainbtn.hidden = false
        playAgainbtn.center = CGPointMake(playAgainbtn.center.x - 500, playAgainbtn.center.y)

        var buttonClear : UIButton
        
        for var i = 0; i < 9; i++ {
            buttonClear = view.viewWithTag(i) as! UIButton
            buttonClear.setImage(nil, forState: .Normal)
        }
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if (boardState[sender.tag] == 0 && gameActive == true) {
            boardState[sender.tag] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                activePlayer = 2
                validateWinningCombination()
            } else {
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                activePlayer = 1
                validateWinningCombination()
            }
            
        }

    }
    
    func validateWinningCombination( ) {
        for combination in winningCombination {
            if(boardState[combination[0]] != 0 && boardState[combination[0]] == boardState[combination[1]] && boardState[combination[1]] == boardState[combination[2]]) {
                
                gameActive = false
                
                if boardState[combination[0]] == 1 {
                    btnMsg.text = "NOUGHTS, WON!"
                } else {
                    btnMsg.text = "CROSSES, WON!"
                }
                
                btnMsg.hidden = false
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.btnMsg.center = CGPointMake(self.btnMsg.center.x + 500, self.btnMsg.center.y )
                    self.playAgainbtn.center = CGPointMake(self.playAgainbtn.center.x + 500, self.playAgainbtn.center.y )
                })
                
                playAgainbtn.hidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnMsg.hidden = true
        btnMsg.center = CGPointMake(btnMsg.center.x - 500, btnMsg.center.y)
        
        playAgainbtn.hidden = true
        playAgainbtn.center = CGPointMake(playAgainbtn.center.x - 500, playAgainbtn.center.y)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

