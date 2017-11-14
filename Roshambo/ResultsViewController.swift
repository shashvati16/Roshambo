//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Shashvati Dash on 11/13/17.
//  Copyright © 2017 udacity. All rights reserved.
//

import UIKit

enum Shape: String{
    case Paper = "Paper"
    case Rock = "Rock"
    case Scissors = "Scissors"
    
    static func randomShape() -> Shape{
        let shapes = ["Paper", "Rock", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class ResultsViewController: UIViewController {
    
  
    @IBOutlet weak var resultImage: UIImageView!
    
   
    @IBOutlet weak var resultLabel: UILabel!
    
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
        // Do any additional setup after loading the view.
    }

    
    

    /*
    // MARK: - Navigation
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: UI
    
    // The displayResult method generates the image and message for the results of a match.
    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    // MARK: Actions
    
    @IBAction private func playAgain() {
        dismiss(animated: true, completion: nil)
    }

}
