//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Tejas Bobale on 20/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

struct Question{
    let q: String
    let a: [String]
    let correctAnswer: String
    
    init(q: String, a:[String], correctAnswer: String) {
        self.q = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
}


