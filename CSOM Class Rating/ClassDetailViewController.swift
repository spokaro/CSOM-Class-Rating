//
//  ClassDetailViewController.swift
//  CSOM Rankings
//
//  Created by Andrew Boucher on 12/8/19.
//  Copyright © 2019 Andres de la Cruz. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {
    @IBOutlet weak var professorTextView: UITableView!
    @IBOutlet weak var classAverageRating: UILabel!
    @IBOutlet weak var className: UILabel!
    var professorArray = [""]
    var reviewArray = [""]
    var currentClass = ""
    var sum = 0.0
    var ratingArray: [Int] = []
    var sumRating: Double! {
        didSet {
            for rating in ratingArray {
                sum = sum + Double(ratingArray[rating])
            }
        }
    }
    var defaultsData = UserDefaults.standard

    
    
    func saveDefaultData() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        professorTextView.delegate = self
        professorTextView.dataSource = self
        
     
        
        className.text = "\(currentClass) Rating:"
        
        if ratingArray.count > 0 {
            classAverageRating.text = "\(String(sumRating/Double(ratingArray.count))) of 5"
        } else {
            classAverageRating.text = "0 of 5"
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview" {
            let destination = segue.destination as! RatingDetailTableViewController
            let index = professorTextView.indexPathForSelectedRow!.row
            destination.professorInReview = professorArray[index]
            destination.reviewText = reviewArray[index]
            if ratingArray.count > 0 {
                destination.rating = ratingArray[index]
            }
            destination.className = currentClass
        }else {
            if let selectedPath = professorTextView.indexPathForSelectedRow {
                professorTextView.deselectRow(at: selectedPath, animated: false)
            }
        }
    }
    
    
    @IBAction func unwindFromRatingDetailViewController(segue: UIStoryboardSegue) {
        let sourceViewController = segue.source as! RatingDetailTableViewController
        if let indexPath = professorTextView.indexPathForSelectedRow {
            professorArray[indexPath.row] = sourceViewController.professorNameTextField.text!
            professorTextView.reloadRows(at: [indexPath], with: .automatic)
        }else {
            let newIndexPath = IndexPath(row: professorArray.count, section: 0)
            professorArray.append(sourceViewController.professorNameTextField.text!)
            reviewArray.append(sourceViewController.classReviewTextView.text!)
            ratingArray.append(Int(sourceViewController.ratingForClass.text!)!)
            professorTextView.insertRows(at: [newIndexPath], with: .automatic)
        }
        saveDefaultData()
    }
    
    @IBAction func reviewButtonPressed(_ sender: UIButton) {
         performSegue(withIdentifier: "toRatingClass", sender: nil)
        
    }
}
extension ClassDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessorCell", for: indexPath)
        cell.textLabel?.text = professorArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return professorArray.count
    }
    
    
}
