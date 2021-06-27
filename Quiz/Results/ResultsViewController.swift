//
//  ResultsViewController.swift
//  Quiz
//
//  Created by Daniel Yamrak on 26.06.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func tryAgainPressed(_ sender: Any) {
        // Reset Quiz table
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResultsViewController: UITableViewDelegate {
    
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
}
