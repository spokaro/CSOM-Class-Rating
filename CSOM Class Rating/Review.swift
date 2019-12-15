//
//  Review.swift
//  CSOM Rankings
//
//  Created by Andrew Boucher on 12/9/19.
//  Copyright © 2019 Andres de la Cruz. All rights reserved.
//

import Foundation

class Review {
    var classInReview: String
    var professor: String
    var rating: Int
    
    init(classInReview: String, professor: String, rating: Int){
        self.classInReview = classInReview
        self.professor = professor
        self.rating = rating
    }
    
    convenience init() {
        self.init(classInReview: "", professor: "", rating: 0)
    }
}
