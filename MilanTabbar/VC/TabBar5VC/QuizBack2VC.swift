//
//  QuizBack2VC.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 21/04/24.


import UIKit

class QuizBack2VC: UIViewController {

    var questionCount: Int = 0
    var corrects: Int = 0

    let backImageV = CustomBackImageView()

    let resultView = CustomResultView()

    let tryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 18)
        button.setTitle("try again".uppercased(), for: .normal)
        return button
    }()

    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customBlack
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 18)
        button.setTitle("back home".uppercased(), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        resultView.createView(view: view, imageName: "result2", result: """
Congrats!\nYou’ve answered \(corrects)/\(questionCount) question!
""")
        addSubView()

        tryButton.addTarget(self, action: #selector(tryBtnTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        NSLayoutConstraint.activate([
            tryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tryButton.widthAnchor.constraint(equalToConstant: Const.wd),
            tryButton.heightAnchor.constraint(equalToConstant: 50),

            backButton.bottomAnchor.constraint(equalTo: tryButton.topAnchor),
            backButton.widthAnchor.constraint(equalToConstant: Const.wd),
            backButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func addSubView() {
        view.addSubview(tryButton)
        view.addSubview(backButton)
    }

    @objc func tryBtnTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc func backBtnTapped() {
        navigationController?.pushViewController(AddItemTabbar(), animated: true)
    }
}
