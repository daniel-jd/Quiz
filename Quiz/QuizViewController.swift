//
//  ViewController.swift
//  Quiz
//
//  Created by Daniel Yamrak on 26.06.2021.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBSegueAction func toResultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        
        print("Segue called 🟢")
        return ResultsViewController(coder: coder)
    }
    
}

