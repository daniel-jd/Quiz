//
//  ViewController.swift
//  Quiz
//
//  Created by Daniel Yamrak on 26.06.2021.
//

import UIKit

class QuizViewController: UIViewController {
    
    private let cellID = "QuizCell"
    private let cellNibName = "QuestionTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 168
    }
    
    @IBSegueAction func toResultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        // pass questions and user answers
        
        return ResultsViewController(coder: coder)
    }
    
}

extension QuizViewController: UITableViewDelegate {
}

extension QuizViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? QuestionTableViewCell {
            let q = questions[indexPath.row]
            cell.configure(with: q)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
