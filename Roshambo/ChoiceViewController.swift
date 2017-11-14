//
//  ViewController.swift
//  Roshambo
//
//  Created by Shashvati Dash on 11/12/17.
//  Copyright © 2017 udacity. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction private func playRock(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as!
            ResultsViewController
        vc.userChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction private func playPaper(_ sender:UIButton){
        performSegue(withIdentifier: "play", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play"{
            let vc = segue.destination as! ResultsViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    // The enum "Shape" represents a play or move
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }

}

