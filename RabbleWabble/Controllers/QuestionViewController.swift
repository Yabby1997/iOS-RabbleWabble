//
//  QuestionViewController.swift
//  RabbleWabble
//
//  Created by Seunghun Yang on 2022/04/05.
//

import UIKit

public class QuestionViewController: UIViewController {

    var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    var questionGroup = QuestionGroup.basicPhrases()
    var questionIndex = 0
    var correctCount = 0
    var incorrectCount = 0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    /// Model -> View
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
    }
    
    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else { return }
        showQuestion()
    }
    
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden.toggle()
        questionView.hintLabel.isHidden.toggle()
    }
    
    // View -> Model
    @IBAction func handleCorrect(_ sender: Any) {
        correctCount += 1
        questionView.correctContentLabel.text = "\(correctCount)"
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        incorrectCount += 1
        questionView.incorrectContentLabel.text = "\(incorrectCount)"
        showNextQuestion()
    }
}
