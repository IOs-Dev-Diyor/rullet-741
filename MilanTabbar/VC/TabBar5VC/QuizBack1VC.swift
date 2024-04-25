//
//  QuizBack1VC.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 21/04/24.
//

import UIKit

class QuizBack1VC: UIViewController {
    
    var questionCount: Int = 0
    var corrects: Int = 0
    
    let backImageV = CustomBackImageView()
    
    let resultView = CustomResultView()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 18)
        button.setTitle("back to quizzes".uppercased(), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        resultView.createView(view: view, imageName: "result1", result: """
Congrats!\nYou’ve answered \(corrects)/\(questionCount) question!
""")
        addSubView()
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: Const.wd),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func addSubView() {
        view.addSubview(nextButton)
    }
}
