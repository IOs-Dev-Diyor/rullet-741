//
//  CustomResultView.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 21/04/24.
//

import Foundation
import UIKit

class CustomResultView {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()
    
     var titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.text = "result".uppercased()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-Bold", size: 18)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
     var Icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var resultLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        return label
    }()
    
    open func createView(view: UIView, imageName: String, result: String) {
        Icon.image = UIImage(named: imageName)
        resultLbl.text = result
        view.addSubview(backView)
        view.addSubview(Icon)
        backView.addSubview(titleLbl)
        backView.addSubview(resultLbl)
        
        NSLayoutConstraint.activate([
            backView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            backView.heightAnchor.constraint(equalToConstant: Const.wd/3),
            
            Icon.bottomAnchor.constraint(equalTo: backView.topAnchor, constant: 40),
            Icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Icon.widthAnchor.constraint(equalToConstant: Const.wd/1.8),
            Icon.heightAnchor.constraint(equalToConstant: Const.wd/1.8),
            
            titleLbl.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            titleLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            titleLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            titleLbl.heightAnchor.constraint(equalToConstant: 20),
            
            resultLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5),
            resultLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            resultLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            resultLbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
           
        ])
    }
}
