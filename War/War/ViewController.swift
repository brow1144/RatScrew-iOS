//
//  ViewController.swift
//  War
//
//  Created by Kyle Brown on 10/18/16.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    var leftScore = 0
    
    
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightScoreLabel: UILabel!
    var rightScore = 0
    
    
    let cardNames = ["ace", "card2","card3","card4","card5","card6","card7","card8","card9", "card10","jack", "queen", "king"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dealTapped(_ sender: UIButton) {

    
        //Randomize left number 0-12
        let leftNumber = Int( arc4random_uniform(13) )
        
        //Randomize right number 0 - 12
        let rightNumber = Int( arc4random_uniform(13) )
    
        
        leftImageView.image = UIImage( named : cardNames[leftNumber] )
        rightImageView.image = UIImage( named : cardNames[rightNumber] )
        
        
        if leftNumber > rightNumber {
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            rightScoreLabel.text = String(rightScore)
            
        } else if leftNumber == rightNumber {
            
            //tie
            
        } else {
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
            leftScoreLabel.text = String(leftScore)
 
        }
        
        if rightScore >= 10 {
            sender.isEnabled = false
            sender.setImage(nil, for: .normal)
            sender.setTitle("Game Over!",for: .normal)
            sender.titleLabel!.font = UIFont(name: "Times New Roman", size: 25)
            sender.setTitleColor(UIColor.red, for: UIControlState.normal)



        }
        if leftScore >= 10 {
            sender.isEnabled = false
            sender.setImage(nil, for: .normal)
            sender.setTitle("Game Over!", for: .normal)
            sender.titleLabel!.font = UIFont(name: "Times New Roman", size: 25)
            sender.setTitleColor(UIColor.red, for: UIControlState.normal)

        }
    }
    
    
    @IBAction func breakTie(_ sender: UIButton) {
        //Randomize left number 0-12
        let leftNumber = Int( arc4random_uniform(13) )
        
        //Randomize right number 0 - 12
        let rightNumber = Int( arc4random_uniform(13) )
        
        
        leftImageView.image = UIImage( named : cardNames[leftNumber] )
        rightImageView.image = UIImage( named : cardNames[rightNumber] )
        
        if leftNumber > rightNumber {
            
            leftScore += 2
            leftScoreLabel.text = String("Won")
            rightScoreLabel.text = String("Lost")
            
        } else if leftNumber == rightNumber {
            
            
            
        } else {
            rightScore += 2
            rightScoreLabel.text = String("Won")
            leftScoreLabel.text = String("Lost")
            
        }
    }
}

