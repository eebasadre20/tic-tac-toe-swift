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

    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if (boardState[sender.tag] == 0) {
            boardState[sender.tag] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                activePlayer = 1
            }
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

