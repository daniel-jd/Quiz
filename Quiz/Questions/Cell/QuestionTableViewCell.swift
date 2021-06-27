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
    @IBOutlet weak var answerButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func answerButtonPressed(_ sender: Any) {
        answerButton.backgroundColor = .systemOrange
        // Set user answer
        // Change BG color?
    }
}

// MARK: TableView Delegate & DataSource

extension QuestionTableViewCell: UITableViewDelegate {
    
}

extension QuestionTableViewCell: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? QTableViewCell {
        
            cell.answerLabel.text = questions[indexPath.section].answers[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
