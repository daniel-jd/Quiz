//
//  QuestionTableViewCell.swift
//  Quiz
//
//  Created by Daniel Yamrak on 27.06.2021.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    private let cellID = "QCellID"
    private let cellNibName = "QTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var qLabel: UILabel!
    
    var answers: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 32
    }
    
    func configure(with question: Question) {
        qLabel.text = question.question
        answers = question.answers
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
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
