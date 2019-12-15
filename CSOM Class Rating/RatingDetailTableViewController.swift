//
//  RatingDetailTableViewController.swift
//  CSOM Rankings
//
//  Created by Andrew Boucher on 12/8/19.
//  Copyright © 2019 Andres de la Cruz. All rights reserved.
//

import UIKit

class RatingDetailTableViewController: UITableViewController {
    @IBOutlet weak var classNameInRaiting: UILabel!
    @IBOutlet weak var professorNameTextField: UITextField!
    @IBOutlet weak var classReviewTextView: UITextView!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarrButton: UIBarButtonItem!
    @IBOutlet weak var ratingForClass: UITextField!
    
    
    
    var professorInReview: String?
    var reviewText: String?
    var className: String?
    var rating: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        
        if let professorInReview = professorInReview {
            professorNameTextField.text = professorInReview
        }
        if let reviewText = reviewText {
            classReviewTextView.text = reviewText
        }
        
        if let className = className{
            classNameInRaiting.text = className
        }
        
        if let rating = rating {
            ratingForClass.text = String(rating)
        }
        enableDisableSaveButton()
    }
    
    
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func enableDisableSaveButton() {
        if professorNameTextField.text != "" {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveRating" {
            let destination = segue.destination as! ClassDetailViewController
            destination.professorArray.append(professorNameTextField.text!)
            destination.reviewArray.append(classReviewTextView.text!)
            destination.ratingArray.append(rating!)
        }else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: false)
            }
        }
    }
    
    func saveThenSegue() {
        leaveViewController()
    }
    
    @IBAction func reviewTitleChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction func returnTitleDonePressed(_ sender: UITextField) {
        enableDisableSaveButton()
        
    }
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
    
}
