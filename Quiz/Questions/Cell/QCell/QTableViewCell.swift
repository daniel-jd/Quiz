//
//  QTableViewCell.swift
//  Quiz
//
//  Created by Daniel Yamrak on 27.06.2021.
//

import UIKit

class QTableViewCell: UITableViewCell {

    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            selectedBackgroundView?.backgroundColor = .systemOrange
        } else {
            selectedBackgroundView?.backgroundColor = .white
        }
    }
    
}
