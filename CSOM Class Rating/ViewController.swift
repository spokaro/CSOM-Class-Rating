//
//  ViewController.swift
//  CSOM Class Rating
//
//  Created by Andrew Boucher on 12/12/19.
//  Copyright © 2019 Andres de la Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var concentration = Concentration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConcentration" {
            let destination = segue.destination as! ConcentrationDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            destination.currentConcentration = concentration.concentrationsArray[index]
        }else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: false)
            }
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concentration.concentrationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = concentration.concentrationsArray[indexPath.row]
        return cell
    }
    
    
}
