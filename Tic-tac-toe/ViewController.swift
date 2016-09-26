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
    
    

    @IBOutlet weak var btnMsg: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if (boardState[sender.tag] == 0) {
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
                
                if boardState[combination[0]] == 1 {
                    btnMsg.text = "NOUGHTS, WON!"
                } else {
                    btnMsg.text = "CROSSES, WON!"
                }
                
                btnMsg.hidden = false
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.btnMsg.center = CGPointMake(self.btnMsg.center.x + 500, self.btnMsg.center.y )
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnMsg.hidden = true
        btnMsg.center = CGPointMake(btnMsg.center.x - 500, btnMsg.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

