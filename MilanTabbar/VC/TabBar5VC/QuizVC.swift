//
//  QuizVC.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 20/04/24.


import UIKit

class QuizVC: UIViewController {

    var quizData: [QuizData] = []
    var index = 0
    var score = 0

    lazy var backImageV = CustomBackImageView()

    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()

    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("next".uppercased(), for: .normal)
        return button
    }()

    lazy var counterLbl: UILabel = {
        let label = UILabel()
        label.text = "Question \(index + 1)"
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
        return label
    }()

    lazy var questionText: UITextView = {
        let textView = UITextView()
        textView.text = quizData[index].question.uppercased()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 17, weight: .bold)
        textView.layer.masksToBounds = true
        textView.isEditable = false
        return textView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        navigationItem.hidesBackButton = true
        variantBtns()
        counterBtns()
        addSubviews()
        displayQuestion()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "pop")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(backTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor, constant: Const.hd / 5),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            backView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -Const.hd / 12),

            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            nextButton.heightAnchor.constraint(equalToConstant: 45),

            stackView.topAnchor.constraint(equalTo: questionText.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),

            counterLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 4),
            counterLbl.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            counterLbl.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -30),
            counterLbl.heightAnchor.constraint(equalToConstant: 15),

            questionText.topAnchor.constraint(equalTo: counterLbl.bottomAnchor, constant: 3),
            questionText.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            questionText.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -30),
            questionText.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 2)
        ])
    }

    func addSubviews() {
        view.addSubview(nextButton)
        view.addSubview(backView)
        backView.addSubview(stackView)
        backView.addSubview(counterLbl)
        backView.addSubview(questionText)
    }

    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc func nextTapped(sender: UIButton) {
        index += 1
        counterBtns()
        displayQuestion()
        
        if index == quizData.count - 1 {
            sender.setTitle("FINISH", for: .normal)
        } else {
            sender.setTitle("NEXT", for: .normal)
        }
    }

    func counterBtns() {
        let buttonCount = quizData.count
        let spacing: CGFloat = 8
        let buttonWidth = (UIScreen.main.bounds.width - CGFloat(buttonCount + 1) * spacing) / CGFloat(buttonCount)

        for i in 0..<buttonCount {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: spacing + CGFloat(i) * (buttonWidth + spacing),
                                  y: Const.hd / 9.5,
                                  width: buttonWidth,
                                  height: buttonWidth)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.setTitle("Q\(i + 1)", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = index == i ? .red : .black
            view.addSubview(button)
        }
    }


    func variantBtns() {
        let buttonCount = quizData[index].variants.count
        let buttonHeight = Const.wd / 5.3

        for i in 0..<buttonCount {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = #colorLiteral(red: 0.3443639278, green: 0.3753376603, blue: 0.4079647064, alpha: 1)
            button.tag = i
            button.layer.borderWidth = 1
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            button.contentHorizontalAlignment = .left
            button.titleLabel?.numberOfLines = 3
            button.setTitle("\(quizData[index].variants[i])".uppercased(), for: .normal)
            button.setImage(UIImage(named: ""), for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
            button.contentMode = .scaleAspectFill
            button.titleLabel?.textAlignment = .left
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        }

    }
    
    
 @objc func buttonTapped(_ sender: UIButton) {
        let selectedAnswerIndex = sender.tag

        for view in stackView.subviews {
            if let button = view as? UIButton {
                if button != sender {
                    button.isEnabled = false
                }
            }
        }
     
        let isCorrect = selectedAnswerIndex == quizData[index].answer
    
     if isCorrect {
             score += 1
             sender.layer.borderColor = UIColor.green.cgColor
             if let correctImage = UIImage(named: "correct") {
                 let tintedImage = correctImage.withRenderingMode(.alwaysTemplate)
                 sender.setImage(tintedImage, for: .normal)
                 sender.tintColor = .green
             }
         } else {
             sender.layer.borderColor = UIColor.customRed.cgColor
             if let incorrectImage = UIImage(named: "incorrect") {
                 let tintedImage = incorrectImage.withRenderingMode(.alwaysTemplate)
                 sender.setImage(tintedImage, for: .normal)
                 sender.tintColor = .red
             }
         }
        
    }

    private func displayQuestion() {
        guard index < quizData.count else {
            index = 0
            displayQuestion()
            let vc = QuizBack2VC()
            vc.questionCount = quizData.count
            vc.corrects = score
            navigationController?.pushViewController(vc, animated: true)
            score = 0
            return
        }
        counterLbl.text = "Question \(index + 1)"
        questionText.text = quizData[index].question

        stackView.subviews.forEach { $0.removeFromSuperview() }

        variantBtns()
    }
    
}
