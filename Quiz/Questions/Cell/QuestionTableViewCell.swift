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
    
    func configure(with question: Question, selectedAnswer: Int?, mode: CellMode) {
        self.mode = mode
        qLabel.text = question.question
        selectedIndex = selectedAnswer
        answers = question.answers
        self.question = question
        tableView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}

// MARK: TableView Delegate & DataSource

extension QuestionTableViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? QTableViewCell {
            let userAnswer = cell.answerLabel.text
            print(userAnswer!)
            closure?(indexPath.row)
        }
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
                cell.answerLabel.textColor = .darkGray
            case .results:
                cell.selectionStyle = .none
                if indexPath.row == question?.rightAnswer {
                    cell.answerLabel.textColor = .green
                }
                // TODO: Перевірка чи є вибрана відповідь правильною
                if indexPath.row == selectedIndex {
                    cell.answerLabel.textColor = .systemPink
                }
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
