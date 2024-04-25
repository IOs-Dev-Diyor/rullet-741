//
//  FourthViewController.swift
//  TabTc
//
//  Created by mac on 08/10/21.

import UIKit
class VC4: UIViewController {
    
    let backImage = CustomBackImageView()
    
    var shopBtn = CustomShopBtn()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()
   
     var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "tabbar4.1")
        return image
    }()
    
     var titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
         label.text = "roulette\nsimulator".uppercased()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-Bold", size: 20)
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
     var textView: UITextView = {
        let textView = UITextView()
         textView.text = """
Choose a chip and place your odds on the table. Once you've made your odds, wait for the dealer to spin the ball and for the roulette wheel to come to a stop. Watch to see where the ball lands on the wheel. If you're fortunate, your odds will match the winning number or category, and you'll receive a payout directly into your gaming account. You can use your winnings points to exchange for different chips in the shop
"""
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.layer.masksToBounds = true
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 18)
        button.setTitle("start".uppercased(), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBlack
        backImage.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        shopBtn.createGameView(view: view, title: "SHOP", imageName: "shop")
        addSubviews()
        
        startButton.addTarget(self, action: #selector(nextTappid), for: .touchUpInside)
        shopBtn.button.addTarget(self, action: #selector(shopTappid), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Const.wd/4.4),
            startButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            startButton.heightAnchor.constraint(equalToConstant: 45),
            
            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            titleLbl.widthAnchor.constraint(equalToConstant: Const.wd/2),
            titleLbl.heightAnchor.constraint(equalToConstant: 50),
            
            shopBtn.backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            shopBtn.backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            shopBtn.backView.widthAnchor.constraint(equalToConstant: 100),
            shopBtn.backView.heightAnchor.constraint(equalToConstant: 45),
            
            backView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 30),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            backView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -30),
            
            textView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            textView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 5),
            textView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -5),
            textView.heightAnchor.constraint(equalToConstant: Const.wd/2.2),
            
            imageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 50),
            imageView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -50),
            imageView.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -20),
        ])
        
    }
    
    func addSubviews() {
        view.addSubview(startButton)
        view.addSubview(titleLbl)
        view.addSubview(backView)
        backView.addSubview(textView)
        backView.addSubview(imageView)
    }
    
    @objc func nextTappid() {
        let vc = GameVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func shopTappid() {
        let vc = ShopVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

