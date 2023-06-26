//
//  ViewController.swift
//  Project2
//
//  Created by Nikita on 21.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var numberOfQuestionsAsked = 0
    let questionLimit = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland",
        "italy", "monaco", "nigeria", "poland", "russia", "spain",
        "uk", "us"]
        
        let borderWidth = CGFloat(1)
        
        button1.layer.borderWidth = borderWidth
        button2.layer.borderWidth = borderWidth
        button3.layer.borderWidth = borderWidth
        
        let lightGray = UIColor.lightGray.cgColor
        
        button1.layer.borderColor = lightGray
        button2.layer.borderColor = lightGray
        button3.layer.borderColor = lightGray
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        if numberOfQuestionsAsked < questionLimit {
            numberOfQuestionsAsked += 1
            
            countries.shuffle()
            
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            correctAnswer = Int.random(in: 0...2)
            
            title = countries[correctAnswer].uppercased() + ", Score: \(score)"
        } else {
            let ac = UIAlertController(title: "Game Over", message: "FINAL SCORE: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: playAgain))
            present(ac, animated: true)
        }
    }
    
    func playAgain(action: UIAlertAction!) {
        score = 0
        numberOfQuestionsAsked = 0
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, this is the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cotinue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

