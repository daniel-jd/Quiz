//
//  QuestionTableViewCell.swift
//  Quiz
//
//  Created by Daniel Yamrak on 27.06.2021.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    enum CellMode {
        case editing
        case results
    }
    
    private let cellID = "QCellID"
    private let cellNibName = "QTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var qLabel: UILabel!
    
    var question: Question?
    var answers: [String] = []
    var userAnswers: [String : Int] = [:]
    var closure: ((Int) -> Void)?
    var selectedIndex: Int?
    var mode: CellMode = .editing
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 32
    }
    
    func configureQuiz(with question: Question, selectedAnswer: Int?, mode: CellMode) {
        self.mode = mode
        qLabel.text = question.question
        selectedIndex = selectedAnswer
        self.answers = question.answers
        self.question = question
        tableView.reloadData()
    }
    
    func configureResults(with question: Question, userAnswers: [String : Int], mode: CellMode) {
        self.mode = mode
        qLabel.text = question.question
        self.userAnswers = userAnswers
        self.answers = question.answers
        self.question = question
        tableView.reloadData()
    }
    
}

// MARK: TableView Delegate & DataSource

extension UITableView {
    func deselectAllRows(animated: Bool) {
        guard let selectedRows = indexPathsForSelectedRows else { return }
        for indexPath in selectedRows {
            deselectRow(at: indexPath, animated: animated)
        }
    }
}

extension QuestionTableViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Pass user selected answer index to QuizViewController
        closure?(indexPath.row)
    }
}

extension QuestionTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? QTableViewCell {
            cell.answerLabel.text = answers[indexPath.row]
            
            switch mode {
            case .editing:
                // TODO: винести в окремий метод!!!
                if let selectedIndex = selectedIndex,
                   selectedIndex == indexPath.row {
                    cell.isSelected = true
                    cell.backgroundColor = .systemGreen
                } else {
                    cell.backgroundColor = .white
                }
            
            case .results:
                cell.selectionStyle = .none
                // Color user answers with Red
                if indexPath.row == userAnswers[question!.question] {
                    cell.backgroundColor = .systemRed
                }
                // Color right answers with Green
                if indexPath.row == question?.rightAnswer {
                    cell.backgroundColor = .systemGreen
                }
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
