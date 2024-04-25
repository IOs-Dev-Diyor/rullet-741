//
//  CustomQuizBtn.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 21/04/24.
//

import Foundation
import UIKit

class CustomQuizBtn: UIView {
    
     var question: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3443639278, green: 0.3753376603, blue: 0.4079647064, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        return view
    }()
    
     var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        return button
    }()
    
    open func createView() {
    
        backView.addSubview(question)
        backView.addSubview(icon)
        backView.addSubview(button)
        
        NSLayoutConstraint.activate([
            question.topAnchor.constraint(equalTo: backView.topAnchor),
            question.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            question.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            question.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
          
            icon.topAnchor.constraint(equalTo: backView.topAnchor),
            icon.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            icon.widthAnchor.constraint(equalToConstant: 40),
            icon.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
            button.topAnchor.constraint(equalTo: backView.topAnchor),
            button.leftAnchor.constraint(equalTo: backView.leftAnchor),
            button.rightAnchor.constraint(equalTo: backView.rightAnchor),
            button.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
         
        ])
    }
    
}

