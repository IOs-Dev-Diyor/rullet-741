//
//  BeginViewController.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 16/04/24.
//

import UIKit

class BeginViewController: UIViewController {
    
    let data = BeginVCData.getData()
    var index = 0
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customRed
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("next".uppercased(), for: .normal)
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.customBlack
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("skip".uppercased(), for: .normal)
        return button
    }()
    
    let titleLBL: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.customBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 4
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let backImageView = CustomBackImageView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        backImageView.createBackImage(view: view, named: "back1", triangleColor: .clear)
        addSubView()
        
        nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipBtnTapped), for: .touchUpInside)
       
        getData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let width = view.frame.width
    
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: width),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            
            titleLBL.bottomAnchor.constraint(equalTo:nextButton.topAnchor),
            titleLBL.widthAnchor.constraint(equalToConstant: width),
            titleLBL.heightAnchor.constraint(equalToConstant: width/2.5),
            
            imageView.bottomAnchor.constraint(equalTo: titleLBL.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: width),
            imageView.heightAnchor.constraint(equalToConstant: width),
            
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            skipButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            skipButton.heightAnchor.constraint(equalToConstant: 42),
            skipButton.widthAnchor.constraint(equalToConstant: 73)
        ])
    }
    
    func addSubView() {
        view.addSubview(nextButton)
        view.addSubview(titleLBL)
        view.addSubview(imageView)
        view.addSubview(skipButton)
    }
    
    @objc func nextBtnTapped() {
        if index < data.count - 1 {
                index += 1
                getData()
            } else {
                navigationController?.pushViewController(AddItemTabbar(), animated: true)
            }
    }
    
    @objc func skipBtnTapped() {
        navigationController?.pushViewController(AddItemTabbar(), animated: true)
    }
    
    func getData() {
        let obj = data[index]
        imageView.image = UIImage(named: obj.named)
        titleLBL.text = obj.title.uppercased()
    }
    

}
