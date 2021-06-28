//
//  ViewController.swift
//  Quiz
//
//  Created by Daniel Yamrak on 26.06.2021.
//

import UIKit

class QuizViewController: UIViewController {
    
    private let resultsVCIdn = "ResultsViewController"
    private let cellID = "QuizCell"
    private let cellNibName = "QuestionTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var userAnswers: [String : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 168
    }
    
    @IBAction func showResultsPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: resultsVCIdn) as? ResultsViewController else {
            return
        }
        vc.questions = questions
        vc.userAnswers = userAnswers
        navigationController?.pushViewController(vc, animated: true)
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
            let selectedAnswer = userAnswers[q.question]
            // Set table for Quiz
            cell.configureQuiz(with: q, selectedAnswer: selectedAnswer, mode: .editing)
            cell.closure = { [weak self] index in
                // Store user's answer to dictionary
                self?.userAnswers[q.question] = index
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
