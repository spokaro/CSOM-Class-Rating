//
//  MajorDetailViewController.swift
//  CSOM Rankings
//
//  Created by Andrew Boucher on 12/8/19.
//  Copyright © 2019 Andres de la Cruz. All rights reserved.
//

import UIKit

class ConcentrationDetailViewController: UIViewController {
   
    @IBOutlet weak var concentrationName: UILabel!
    @IBOutlet weak var coreTableView: UITableView!
    @IBOutlet weak var concentrationTableView: UITableView!
    
    let coreClassesArray = ["Portico",
                            "Calculus",
                            "Business Statistics",
                            "Digital Technology: Strategy & Use",
                            "Principles of Microeconomics",
                            "Principles of Macroeconomics",
                            "Introduction to Law",
                            "Financial Accounting",
                            "Managerial Accounting",
                            "Modeling for Business Analytics",
                            "Organizational Behavior",
                            "Operations Management",
                            "Basic Finance",
                            "Principles of Marketing",
                            "Strategic Management"]
    
    var concentrationClassesArray = [""]
    var currentConcentration = ""
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        concentrationName.text = currentConcentration
        coreTableView.delegate = self
        coreTableView.dataSource = self
        concentrationTableView.delegate = self
        concentrationTableView.dataSource = self
        ClassConcentrationArray()
    }
    
    func ClassConcentrationArray() {
        if currentConcentration == "Accounting" {
            concentrationClassesArray = ["Managerial Accounting",
                                         "Financial Accounting Standards and Theory I",
                                         "Financial Accounting Standards and Theory II",
                                         "Managerial Cost Analysis",
                                         "Federal Taxation",
                                         "Audit & Other Assurance Services",
                                         "Financial Statement Analysis",
                                         "Financial Statement Analysis",
                                         "Financial Accounting Standards and Theory III",
                                         "Accounting Inforamtion Systems"]
        } else if currentConcentration == "Accounting for Finance & Consulting" {
            concentrationClassesArray = ["Intermediate Accounting for Finance & Consulting",
                                         "Managerial Cost Analysis",
                                         "Financial Statement Analysis",
                                         "Managerial Cost Analysis",
                                         "Federal Taxation",
                                         "Financial Accounting Standards and Theory III",
                                         "Accounting Information Systems",
                                         "Fair Value Accounting and Measurement",
                                         "Taxes & Management Decisions",
                                         "Forensic Accounting",
                                         "Dive, Dissect & Decide w/ Big Business Data",
                                         "Operations Strategy & Consulting",
                                         "Predictive Analytics",
                                         "Forecasting Techniques",
                                         "Econometric Methods",
                                         "Investment Banking (fulfills FInance 'Bucket' elective)",
                                         "Investment Banking (Fulfills Finance 'Other' elective)" ]
        } else if currentConcentration == "Accounting & Information Systems Concentration" {
            concentrationClassesArray = ["Financial Accounting Standards & Thoery I",
                                         "Introduction to Programming for Management",
                                         "Database Systems an Applications",
                                         "Systems Analysis and Design",
                                         "Accounting Information Systems",
                                         "Financial Accounting Standards and Theory II",
                                         "Managerial Cost & Strategic Analysis",
                                         "Audit & Other Assurance Services",
                                         "Financial Statement Analysis",
                                         "Dive, Dissect & Decide with Big Business Data"]
        }else if currentConcentration == "Business Analytics" {
            concentrationClassesArray = ["Data Analytics in Practice",
                                         "Management Science",
                                         "Predictive Analytics",
                                         "Quality Management",
                                         "Sports Analytics",
                                         "Risk Analysis & Simulation",
                                         "Forecasting Techniques",
                                         "Machine Learning for Business Intelligence",
                                         "Pricing & Revenue Optimization",
                                         "Programming for Management and Analytics",
                                         "Database Systems & Applications",
                                         "Social Media, Emerging Tech., & Digital Business",
                                         "Data Visualization",
                                         "Geographic Info Systems",
                                         "Customer Research & Marketing Decisions",
                                         "Customer Relationship Management",
                                         "Marketing Analytics for Customer Insights",
                                         "Dive, Dissect, and Decide with Big Business Data",
                                         "Data Analytics in Finance"]
        } else if currentConcentration == "Corporate Reporting & Analysis" {
            concentrationClassesArray = ["Financial Accounting Standards and Theory I",
                                         "Financial Accounting Standards and Theory II",
                                         "Financial Statement Analysis",
                                         "Financial Accounting Standards and Theory III",
                                         "Fair Value Accounting",
                                         "Economic Methods",
                                         "Economic and Business Forecasting Methods",
                                         "Applied Analytics",
                                         "Forecasting Techniques"]
        } else if currentConcentration == "Economics" {
            concentrationClassesArray = ["Principles of Economics",
                                         "Statics",
                                         "Microeconomic Theory",
                                         "Macroeconmic Theory",
                                         "Econometric Methods"]
        } else if currentConcentration == "Entrepreneurship" {
            concentrationClassesArray = ["Entrepreneurial Management",
                                         "Special Topics: Managing Digital Innovation",
                                         "Entrepreneurial Finance",
                                         "Venture Capital / Private Equity",
                                         "Social Innovation & Entrepreneurship",
                                         "Law for the Entrepreneurship",
                                         "TechTrek West",
                                         "TechTrek East",
                                         "Digital Commerce",
                                         "Social Media, Emerging Tech., and Digital Business",
                                         "Analytics and Business Intelligence",
                                         "Negotiation",
                                         "Social Innovation and Entrepreneurship",
                                         "Special Topics: Launching Digital Marketing",
                                         "Product Planning & Strategy",
                                         "Entrepreneurial Marketing",
                                         "Perspectives on Management"]
        } else if currentConcentration == "Finance" {
            concentrationClassesArray = ["Corporate Finance",
                                         "Investments",
                                         "Derivatives & Risk Management",
                                         "Corporate Financial Strategies",
                                         "Financial Policy",
                                         "International Finance",
                                         "Investment Banking",
                                         "Fixed Income Analysis",
                                         "Data Analytics in Finance"]
        } else if currentConcentration == "General Management" {
            concentrationClassesArray = ["Financial Accounting Standards & Theory I",
                                         "Finanical Accounting Standards & Theory II",
                                         "Managerial Cost & Strategic Analysis",
                                         "Financial Statement Analysis",
                                         "Federal Taxation",
                                         "Accouting Information Systems",
                                         "Corporate Finance",
                                         "Investments",
                                         "Marketing Research",
                                         "Applied Marketing Management",
                                         "Leadership",
                                         "Introduction to Programming for Management",
                                         "Database Systems and Applications",
                                         "Systems Analysis and Design",
                                         "Operations, Strategy, and Consulting",
                                         "Managing Projects",
                                         "Quality Management",
                                         "Predictive Analysis",
                                         "Supply Chain Management",
                                         "Management Science",
                                         "Risk Analysis & Simulation",
                                         "Economic & Financial Forecasting",
                                         "Sports Analytics"]
        } else if currentConcentration == "Information Systems" {
            concentrationClassesArray = ["Programming for Management & Analytics",
                                         "Database Systems & Applications",
                                         "Systems Analysis & Design",
                                         "Dive, Dissect and Decide with Big Business Data",
                                         "Swift/iOS App Development",
                                         "Managing Projects",
                                         "Tecnology and Culture",
                                         "TechTrek West",
                                         "TechTrek East",
                                         "Management of Digital Innovation",
                                         "Data Analytics in Practice",
                                         "Managing for Social Impact",
                                         "Accounting Information Systems",
                                         "Marketing Information Analytics",
                                         "Social Media and Digital Business",
                                         "Geographic Information Systems",
                                         "New Media Industries",
                                         "Cybersecurity Strategy and Management",
                                         "Data Visualization"]
        } else if currentConcentration == "Management & Leadership" {
            concentrationClassesArray = ["Organizational Behavior",
                                         "Leadership"]
        } else if currentConcentration == "Managing for Social Impact & Publc Good" {
            concentrationClassesArray = ["Meanaging for Social Impact",
                                         "Leading for Social Impact"]
        }else if currentConcentration == "Marketing" {
            concentrationClassesArray = ["Marketing Principles",
                                         "Customer Research and Marketing Decisions",
                                         "Applied Marketing Management",
                                         "Consumer Behavior",
                                         "Service Marketing",
                                         "Retailing",
                                         "Integrated Marketing Communications",
                                         "Special Topic: Launching Digital Marketing",
                                         "Professional Selling & Sales Management",
                                         "Product Planning & Strategy",
                                         "Strategic Brand Management",
                                         "Entrepreneurial Marketing in a Digital World",
                                         "Marketing Practicum",
                                         "Heritage Marketing",
                                         "Special Topic: Design Thinking & Strategy",
                                         "Digital Commerce",
                                         "Marketing Analytics for Customer Insights",
                                         "Luxury Marketing",
                                         "Professional Selling & Sales Management",
                                         "Sports Marketing",
                                         "Social Media, Emerging Tech., and Digital Business",
                                         "New Media Industries"]
        }else {
            concentrationClassesArray = ["Operations Strategy and Consulting",
                                         "Managing Projects",
                                         "Quality Management",
                                         "Sports Analytics",
                                         "Supply Chain Management",
                                         "Predictive Analytics",
                                         "Management Science",
                                         "Risk Analysis & Simulation",
                                         "Forecasting Techniques",
                                         "Pricing & Revenue Optiomization" ]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConcentrationClassRating" {
            let destination = segue.destination as! ClassDetailViewController
            let index = concentrationTableView.indexPathForSelectedRow!.row
            destination.currentClass = concentrationClassesArray[index]
            
        }else if segue.identifier == "toCoreClassRating" {
            let destination = segue.destination as! ClassDetailViewController
            let index = coreTableView.indexPathForSelectedRow!.row
            destination.currentClass = coreClassesArray[index]
        }else {
            if let selectedPath = coreTableView.indexPathForSelectedRow {
                coreTableView.deselectRow(at: selectedPath, animated: false)

            }else if let selectedPath = concentrationTableView.indexPathForSelectedRow {
                concentrationTableView.deselectRow(at: selectedPath, animated: false)
        }
    }
    }
}
extension ConcentrationDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if tableView == coreTableView{
            count = coreClassesArray.count
        }
        if tableView == concentrationTableView
        {
            count = concentrationClassesArray.count
        }
        return count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        if tableView == coreTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "CoreCell", for: indexPath)
            let previewDetail = coreClassesArray[indexPath.row]
            cell!.textLabel!.text = previewDetail
        } else if tableView == concentrationTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "ConcentrationCell", for: indexPath)
            let previewDetail = concentrationClassesArray[indexPath.row]
            cell!.textLabel!.text = previewDetail
        }
        return cell!
    }
}

