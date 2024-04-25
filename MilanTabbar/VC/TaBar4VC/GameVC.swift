//
//  GameVC.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 22/04/24.
//

import Foundation
import UIKit

class GameVC: UIViewController {
    
    var gameData = ShopData.getShopData()
    let coinValue = [10, 25, 50, 100]
    var index: Int {
           get {
               return UserDefaults.standard.integer(forKey: "index")
           }
           set {
               UserDefaults.standard.set(newValue, forKey: "index")
           }
       }
     
    var myMoney: Int = 10000
    
//    {
//        get {
//            return UserDefaults.standard.integer(forKey: "money")
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: "money")
//            totalMoneyLbl.text = "total: \(newValue)".uppercased()
//        }
//    }

    var coinSelect: Int  = 0
    let slices = Array(repeating: 0, count: 8)
    
    var numbersArray = Array(1...48)
    lazy var randomIndex = Int.random(in: 0..<numbersArray.count)
    lazy var randomNumber = numbersArray[randomIndex]
    var selectNumber = 0
    
    let backImage = CustomBackImageView()
    
    let backBtn = CustomBackButton()
    
    let spinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        button.isEnabled = false
        button.alpha = 0.5
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("spin".uppercased(), for: .normal)
        return button
    }()
    
    let tryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("play again".uppercased(), for: .normal)
        return button
    }()
    
    let backHomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        button.backgroundColor = UIColor.customBlack
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("home".uppercased(), for: .normal)
        return button
    }()
    
    lazy var totalMoneyLbl: UILabel = {
      let label = UILabel()
        label.backgroundColor = UIColor.customBlack
        label.text = "total:\(myMoney)".uppercased()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont(name: "GillSans-Bold", size: 13)
       label.textColor = UIColor.white
       label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.customRed.cgColor
       label.textAlignment = .center
       return label
   }()
    
     var oddLbl: UILabel = {
      let label = UILabel()
       label.backgroundColor = UIColor.customBlack
       label.text = "odd:\(0)".uppercased()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont(name: "GillSans-Bold", size: 13)
       label.textColor = UIColor.white
       label.layer.borderWidth = 2
       label.layer.borderColor = UIColor.customRed.cgColor
       label.textAlignment = .center
       return label
   }()
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        view.spacing = 4
        return view
    }()
    
    let resultBtn: UIButton = {
       let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "result"), for: .normal)
        return view
    }()
    
    var coinBtn1: UIButton!
    var coinBtn2: UIButton!
    var coinBtn3: UIButton!
    var coinBtn4: UIButton!
    
    var gameBoard: UIView!
    var cards = [UIButton]()
    
    var spinnerImageView = SpinnerImageView(frame: .zero)
    
    let GameResultBackView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var resultInfo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 24)
        button.setTitleColor(UIColor.customRed, for: .normal)
        button.contentMode = .scaleToFill
        button.setImage(UIImage(named: "\(gameData[index].imageNames[coinSelect])"), for: .normal)
//        button.setTitle("You lost-\(coinValue[0])!".uppercased(), for: .normal)
        button.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0,left: 35,bottom: 0,right: 35)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    let resultOddLbl: UILabel = {
       let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Your odds: 20 RED\nResult 9 black"
        view.textColor = .white
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBlack
        navigationItem.hidesBackButton = true
        resultBtn.isHidden = true
//        isSpin = false
        backImage.createBackImage(view: view, named: "back2", triangleColor: UIColor.clear)
        
        backBtn.createButton(view: view)
        
        print("\(myMoney)")
        addSubviews()
        setupStackView()
        createGameBoard()
        addImageViewsToStackView()
        setupSpennir()
        setupGameResultView()
        setupBackButtons()
        
        let displaylink = CADisplayLink(target: self,selector: #selector(step))
        displaylink.add(to: .current, forMode: .default)
        backBtn.button.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        spinButton.addTarget(self, action: #selector(nextTappid), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            spinButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            spinButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            spinButton.heightAnchor.constraint(equalToConstant: 45),
            
            totalMoneyLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            totalMoneyLbl.widthAnchor.constraint(equalToConstant: Const.wd/2),
            totalMoneyLbl.heightAnchor.constraint(equalToConstant: Const.wd/9),
            totalMoneyLbl.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            
            resultBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            resultBtn.widthAnchor.constraint(equalToConstant: 33),
            resultBtn.heightAnchor.constraint(equalToConstant: 33),
            resultBtn.bottomAnchor.constraint(equalTo: spinButton.topAnchor, constant: -15),
            
            oddLbl.leftAnchor.constraint(equalTo: totalMoneyLbl.rightAnchor, constant: 0),
            oddLbl.widthAnchor.constraint(equalToConstant: Const.wd/2),
            oddLbl.heightAnchor.constraint(equalToConstant: Const.wd/9),
            oddLbl.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            
        ])
    }
    
    func addSubviews() {
        view.addSubview(spinButton)
        view.addSubview(totalMoneyLbl)
        view.addSubview(oddLbl)
        view.addSubview(resultBtn)
    }
    
    func setupSpennir() {
        spinnerImageView.translatesAutoresizingMaskIntoConstraints = false
        spinnerImageView.equalSlices = true
        spinnerImageView.isHidden = true
        spinnerImageView.slices = slices
        spinnerImageView.contentMode = .scaleAspectFill
        spinnerImageView.image = UIImage(named: "wheel")
        view.addSubview(spinnerImageView)
        
        NSLayoutConstraint.activate([
            spinnerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinnerImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            spinnerImageView.widthAnchor.constraint(equalToConstant: Const.wd - 40),
            spinnerImageView.heightAnchor.constraint(equalToConstant: Const.wd - 40)
        ])
    }
    
    private func setupStackView() {
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            stackView.widthAnchor.constraint(equalToConstant: Const.wd*4/8 + 20),
            stackView.heightAnchor.constraint(equalToConstant: Const.wd/8),
            stackView.bottomAnchor.constraint(equalTo: spinButton.topAnchor, constant: -15)
        ])
    }

    func createGameBoard() {
        
        let mgY = Const.wd/10

        gameBoard = UIView()
        gameBoard.translatesAutoresizingMaskIntoConstraints = false
        gameBoard.backgroundColor = .clear
        view.addSubview(gameBoard)

        NSLayoutConstraint.activate([
            gameBoard.topAnchor.constraint(equalTo: view.topAnchor, constant: mgY),
            gameBoard.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 55),
            gameBoard.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -55),
            gameBoard.bottomAnchor.constraint(equalTo: totalMoneyLbl.topAnchor, constant: -20)
        ])
        
        let buttonWidth = Const.wd / 6
        let buttonHeight: CGFloat = buttonWidth / 2
        let buttonSpacing: CGFloat = 1
        
        for j in 0..<6 {
            let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
            button.backgroundColor = .green
            button.frame = CGRect(x: 2 - buttonHeight/2
                                  , y: CGFloat(j) * (buttonHeight * 2 + 1) + mgY + buttonHeight/2,
                                  width: buttonWidth,
                                  height: buttonHeight)
            let number = j + 1
            button.tag = number
            button.backgroundColor = #colorLiteral(red: 0.4386363029, green: 0.4300585389, blue: 0.4889978766, alpha: 1)
            button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 14)
            button.setTitleColor(UIColor.white, for: .normal)
            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            button.setTitle("\(number)", for: .normal)
            button.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 0,left: 15,bottom: 0,right: 15)
            button.semanticContentAttribute = .forceRightToLeft
            
            switch number {
            case 1:
                button.setTitle("1-18", for: .normal)
            case 2:
                button.setTitle("even".uppercased(), for: .normal)
            case 3:
                button.setTitle("".uppercased(), for: .normal)
                button.backgroundColor = UIColor.customRed
            case 4:
                button.isHidden = true
            case 5:
                button.setTitle("odd".uppercased(), for: .normal)

            case 6:
                button.setTitle("19-36".uppercased(), for: .normal)
            default:
                button.setTitle("".uppercased(), for: .normal)
            }
            gameBoard.addSubview(button)
            button.addTarget(self, action: #selector(didtapNumbers(_ :)), for: .touchUpInside)
        }
        
        for j in 0..<3 {
            let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
            button.backgroundColor = .magenta
            button.frame = CGRect(x: 38 - buttonHeight*3/2, y: CGFloat(j) * (buttonHeight * 4 + 1) + mgY + buttonHeight*3/2, width: buttonWidth*2, height: buttonHeight)
            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            let number = j + 7
            button.tag = number
            button.backgroundColor = #colorLiteral(red: 0.4386363029, green: 0.4300585389, blue: 0.4889978766, alpha: 1)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 14)
            button.setTitleColor(UIColor.white, for: .normal)
            button.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 0,left: 15,bottom: 0,right: 15)
            button.semanticContentAttribute = .forceRightToLeft
            
            switch j + 1 {
            case 1:
                button.setTitle("1-12", for: .normal)
            case 2:
                button.setTitle("13-24", for: .normal)
            case 3:
                button.setTitle("25-36", for: .normal)
            default:
                button.setTitle("", for: .normal)
            }
           
            gameBoard.addSubview(button)
            button.addTarget(self, action: #selector(didtapNumbers(_ :)), for: .touchUpInside)
        }
        
        for i in 0..<3 {
            for j in 0..<13 {
                let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
                let xPosition = CGFloat(i) * (buttonWidth + buttonSpacing) + 75
                let yPosition = CGFloat(j) * (buttonHeight + buttonSpacing) + mgY
                
                
                button.frame = CGRect(x: xPosition, y: yPosition, width: buttonWidth, height: buttonHeight)
                let number = (j * 3) + i + 10
                button.tag = number
                button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 14)
                button.setTitleColor(UIColor.white, for: .normal)
                button.setImage(nil, for: .normal)
                button.contentMode = .scaleAspectFit
                button.titleLabel?.preferredMaxLayoutWidth = buttonHeight
                button.setTitle("\(number)", for: .normal)
                button.contentMode = .scaleAspectFit
                button.imageEdgeInsets = UIEdgeInsets(top: 0,left: 15,bottom: 0,right: 15)
                button.semanticContentAttribute = .forceRightToLeft
                if number % 2 == 0 || number > 67{
                    button.backgroundColor = .customRed
                } else {
                    button.backgroundColor = .customBlack
                }
                
                switch (j * 3) + i + 1 {
                case 37:
                    button.backgroundColor = #colorLiteral(red: 0.4386363029, green: 0.4300585389, blue: 0.4889978766, alpha: 1)
                    button.setTitle("1st", for: .normal)
                case 38:
                    button.backgroundColor = #colorLiteral(red: 0.4386363029, green: 0.4300585389, blue: 0.4889978766, alpha: 1)
                    button.setTitle("2nd", for: .normal)
                case 39:
                    button.backgroundColor = #colorLiteral(red: 0.4386363029, green: 0.4300585389, blue: 0.4889978766, alpha: 1)
                    button.setTitle("3rd", for: .normal)
              
                default:
                    button.setTitle("\(number)", for: .normal)
                }
                gameBoard.addSubview(button)
                
                button.addTarget(self, action: #selector(didtapNumbers(_ :)), for: .touchUpInside)
            }
        }
}

    @objc func didtapNumbers(_ sender: UIButton) {
        print("button tags: \(sender.tag)")
        let allButtonTags = Array(1...72)
        let currentButtonTag = sender.tag
        selectNumber = sender.tag
        allButtonTags.filter { $0 != currentButtonTag }.forEach { tag in
            if let button = self.view.viewWithTag(tag) as? UIButton {
                button.isSelected = false
                resetButtonImages()
            }
        }
        spinButton.isEnabled = true
        spinButton.alpha = 1
            if coinSelect < gameData[index].imageNames.count {
                sender.setImage(UIImage(named:"\(gameData[index].imageNames[coinSelect])"), for: .normal)
            } else {
                print("Error: coinSelect index out of bounds")
            }
        
        sender.alpha = 1
        
        resultInfo.setImage(UIImage(named: "\(gameData[index].imageNames[coinSelect])"), for: .normal)
        resultInfo.setTitle("You lost-\(coinValue[coinSelect])!".uppercased(), for: .normal)
        
        sender.isSelected = !sender.isSelected

    }


    private func addImageViewsToStackView() {
        coinBtn1 = createImageView()
        coinBtn2 = createImageView()
        coinBtn3 = createImageView()
        coinBtn4 = createImageView()
    
        coinBtn1.setImage(UIImage(named: "\(gameData[index].imageNames[0])"), for: .normal)
        coinBtn2.setImage(UIImage(named: "\(gameData[index].imageNames[1])"), for: .normal)
        coinBtn3.setImage(UIImage(named: "\(gameData[index].imageNames[2])"), for: .normal)
        coinBtn4.setImage(UIImage(named: "\(gameData[index].imageNames[3])"), for: .normal)
        
        coinBtn1.tag = 1
        coinBtn2.tag = 2
        coinBtn3.tag = 3
        coinBtn4.tag = 4
        
        coinBtn1.alpha =  1
        coinBtn2.alpha = 0.5
        coinBtn3.alpha = 0.5
        coinBtn4.alpha = 0.5
        
        stackView.addArrangedSubview(coinBtn1)
        stackView.addArrangedSubview(coinBtn2)
        stackView.addArrangedSubview(coinBtn3)
        stackView.addArrangedSubview(coinBtn4)
        
        coinBtn1.addTarget(self, action: #selector(coinTapped(_ :)), for: .touchUpInside)
        coinBtn2.addTarget(self, action: #selector(coinTapped(_ :)), for: .touchUpInside)
        coinBtn3.addTarget(self, action: #selector(coinTapped(_ :)), for: .touchUpInside)
        coinBtn4.addTarget(self, action: #selector(coinTapped(_ :)), for: .touchUpInside)
    }
    
    private func createImageView() -> UIButton {
        let button = UIButton()
//        button.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: Const.wd/8).isActive = true
        button.heightAnchor.constraint(equalToConstant: Const.wd/8).isActive = true
        return button
    }
    
    
    @objc func backBtnTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc func coinTapped(_ sender: UIButton) {
        print("coinTapped: \(sender.tag)")
        
        let allButtonTags = [1, 2, 3, 4]
        
        let currentButtonTag = sender.tag

        allButtonTags.filter { $0 != currentButtonTag }.forEach { tag in
            if let button = self.view.viewWithTag(tag) as? UIButton {
                button.backgroundColor = UIColor.clear
                button.alpha = 0.5
                button.isSelected = false
            }
        }

        coinSelect = currentButtonTag - 1
        sender.alpha = 1
        sender.isSelected = !sender.isSelected
    }

    
    @objc func nextTappid() {
        
        resetButtonImages()
        stackView.isHidden = true
        self.gameBoard.isHidden = true
        spinnerImageView.isHidden = false
        self.spinnerImageView.startAnimating(fininshIndex: 0, offset: CGFloat(-(360/self.slices.count)/2), { [self] (finished) in
            print(finished)
            if finished {
                self.GameResultBackView.isHidden = false
                self.tryButton.isHidden = false
                self.backHomeButton.isHidden = false
                print("Animation finished: \(slices)")
                deductMoneyAndUpdateUI()
                    }
        })
    }
    
//    func deductMoneyAndUpdateUI() {
//        myMoney = 0
//        if selectNumber == randomNumber {
//            myMoney += coinValue[coinSelect]
//            resultInfo.setTitle("you win-\(myMoney)!", for: .normal)
//            resultInfo.setTitleColor(UIColor.yellow, for: .normal)
//        } else {
//            myMoney -= coinValue[coinSelect]
//            resultInfo.setTitle("you lost-\(myMoney)!", for: .normal)
//            resultInfo.setTitleColor(UIColor.customRed, for: .normal)
//        }
//
//        totalMoneyLbl.text = "total: \(myMoney.update)"
//    }
    func deductMoneyAndUpdateUI() {
         myMoney = 0
        if selectNumber == randomNumber {
            myMoney += coinValue[coinSelect]
            resultInfo.setTitle("you win-\(myMoney)!", for: .normal)
            resultInfo.setTitleColor(UIColor.yellow, for: .normal)
        } else {
            myMoney -= coinValue[coinSelect]
            resultInfo.setTitle("you lost-\(myMoney)!", for: .normal)
            resultInfo.setTitleColor(UIColor.customRed, for: .normal)
        }
        
    }

    func resetButtonImages() {
        for subview in gameBoard.subviews {
            if let button = subview as? UIButton {
                button.setImage(nil, for: .normal)
            }
        }
    }
    
    func startAnimating(fininshIndex: Int, offset: CGFloat, completion: ((Bool) -> Void)? = nil) {
        completion?(true)
    }
    
    @objc func step(displaylink: CADisplayLink) {
        
    }
}

extension GameVC {
    func setupBackButtons() {
        
        tryButton.isHidden = true
        backHomeButton.isHidden = true
        view.addSubview(tryButton)
        view.addSubview(backHomeButton)
        
        tryButton.addTarget(self, action: #selector(gameAgain(_ :)), for: .touchUpInside)
        backHomeButton.addTarget(self, action: #selector(backHomeTapped(_ :)), for: .touchUpInside)
    
        NSLayoutConstraint.activate([
            tryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tryButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            tryButton.heightAnchor.constraint(equalToConstant: 45),
            
            backHomeButton.bottomAnchor.constraint(equalTo: tryButton.topAnchor, constant: -10),
            backHomeButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            backHomeButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    @objc func gameAgain(_ sender: UIButton) {
        spinButton.isEnabled = false
        spinButton.alpha = 0.5
        stackView.isHidden = false
        gameBoard.isHidden = false
        spinnerImageView.isHidden = true
        GameResultBackView.isHidden = true
        tryButton.isHidden = true
        backHomeButton.isHidden = true
    }
    
    @objc func backHomeTapped(_ sender: UIButton) {
        gameBoard.isHidden = false
        navigationController?.pushViewController(AddItemTabbar(), animated: true)
    }
}

extension GameVC {
  func setupGameResultView() {
      GameResultBackView.backgroundColor = .clear
      GameResultBackView.isHidden = true
      view.addSubview(GameResultBackView)
      GameResultBackView.addSubview(resultInfo)
      GameResultBackView.addSubview(resultOddLbl)
      
      NSLayoutConstraint.activate([
        GameResultBackView.bottomAnchor.constraint(equalTo: spinnerImageView.topAnchor, constant: -10),
        GameResultBackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
        GameResultBackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        GameResultBackView.heightAnchor.constraint(equalToConstant: 70),
        
        resultInfo.topAnchor.constraint(equalTo: GameResultBackView.topAnchor, constant: 0),
        resultInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        resultInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        resultInfo.heightAnchor.constraint(equalToConstant: 35),
        
        resultOddLbl.bottomAnchor.constraint(equalTo: GameResultBackView.bottomAnchor, constant: 0),
        resultOddLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        resultOddLbl.widthAnchor.constraint(equalToConstant: Const.wd/3),
        resultOddLbl.heightAnchor.constraint(equalToConstant: 35),
      ])
      
    }
}

extension GameVC {
    
}
