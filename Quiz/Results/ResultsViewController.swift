//
//  ResultsViewController.swift
//  Quiz
//
//  Created by Daniel Yamrak on 26.06.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    private let cellID = "QuizCell"
    private let cellNibName = "QuestionTableViewCell"
    private let quizVCIdn = "QuizViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    var questions: [Question] = []
    var userAnswers: [String : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 168
    }
    
    @IBAction func tryAgainPressed(_ sender: Any) {
        // TODO: Reset userAnswers
        userAnswers = [:]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: quizVCIdn) as? QuizViewController else {
            return
        }
        vc.userAnswers = [:]
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResultsViewController: UITableViewDelegate {
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? QuestionTableViewCell {

            cell.configureResults(with: questions[indexPath.row],
                                  userAnswers: userAnswers,
                                  mode: .results)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
