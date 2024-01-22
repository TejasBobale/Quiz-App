//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!    
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var questionNo: UILabel!
   
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!

    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    
    @IBAction func answer(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!

        if quizBrain.checkAnswer(userAnswer){
            sender.backgroundColor = UIColor.green
            quizBrain.scoreUpdate()
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.updateQuestionNumber()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionNo.text = "Question No : \(quizBrain.questionNumber+1)"
        scoreBoard.text = "Score : \(quizBrain.score)"
        question.text = quizBrain.updateQuestion()
        btn1.backgroundColor = UIColor.clear
        btn2.backgroundColor = UIColor.clear
        btn3.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.updateProgressbar()
        btn1.setTitle(quizBrain.quiz[quizBrain.questionNumber].a[0], for: .normal)
        btn2.setTitle(quizBrain.quiz[quizBrain.questionNumber].a[1], for: .normal)
        btn3.setTitle(quizBrain.quiz[quizBrain.questionNumber].a[2], for: .normal)
    }
}

