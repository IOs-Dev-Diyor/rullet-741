//
//  StartVC.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 19/04/24.
//

import UIKit

class StartVC: UIViewController {

    var startDesc: TabBar5Data?
    
    var chooseQuizData: [QuizData]?
    
    
    let backImageV = CustomBackImageView()
    
    lazy var titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.text = startDesc?.title.uppercased()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()
    
    lazy var cardIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: startDesc!.cardIcon)
        return image
    }()
    
    lazy var descTitleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-Bold", size: 18)
        label.numberOfLines = 2
        label.text = startDesc?.descTitle.uppercased()
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = startDesc?.desc
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.layer.masksToBounds = true
        textView.isEditable = false
        return textView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("start".uppercased(), for: .normal)
        return button
    }()
    
    let backBtn = CustomBackButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        
        navigationItem.hidesBackButton = true
       addSubView()
        
        backBtn.createButton(view: view)
        backBtn.button.addTarget(self, action: #selector(backTappid), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextTappid), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            
            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            titleLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            titleLbl.heightAnchor.constraint(equalToConstant: 20),
            
            backView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: Const.wd/10),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            backView.heightAnchor.constraint(equalToConstant: Const.wd),
            backView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -Const.wd/6),
            
            cardIcon.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: Const.wd/15),
            cardIcon.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            cardIcon.widthAnchor.constraint(equalToConstant: Const.wd/1.3),
            cardIcon.heightAnchor.constraint(equalToConstant: Const.wd/1.4),
            
            descTitleLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: Const.wd*1.3/1.8),
            descTitleLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            descTitleLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10),
            descTitleLbl.heightAnchor.constraint(equalToConstant: 50),
            
            textView.topAnchor.constraint(equalTo: descTitleLbl.bottomAnchor, constant: 0),
            textView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            textView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            textView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10)
        ])
    }
    
    func addSubView() {
        view.addSubview(backView)
        view.addSubview(nextButton)
        view.addSubview(titleLbl)
        view.addSubview(cardIcon)
        view.addSubview(descTitleLbl)
        view.addSubview(textView)
    }
    
    @objc func backTappid() {
        print("\((view.frame.width - 40)/2)")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextTappid() {
        let vc = QuizVC()
        vc.quizData = chooseQuizData ?? []
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
