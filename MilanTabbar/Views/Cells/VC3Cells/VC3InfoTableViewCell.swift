//
//  VC3InfoCollectionViewCell.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 19/04/24.
//

import UIKit

class VC3InfoTableViewCell: UITableViewCell {
    
    static let identifier = "VC3InfoTableViewCell"
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-UltraBold", size: 13)
        label.textColor = UIColor.customRed
        label.textAlignment = .left
        return label
    }()
    
    let numberLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.customBlack
        label.textColor = UIColor.customRed
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.customRed.cgColor
        return label
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 14)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        contentView.addSubview(backView)
        backView.addSubview(titleLbl)
        backView.addSubview(textView)
        contentView.addSubview(numberLbl)
}
    
    func setupConstraints() {
            NSLayoutConstraint.activate([
                numberLbl.topAnchor.constraint(equalTo: contentView.topAnchor),
                numberLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
                numberLbl.widthAnchor.constraint(equalToConstant: 40),
                numberLbl.heightAnchor.constraint(equalToConstant: 40),
                
                backView.topAnchor.constraint(equalTo: contentView.topAnchor),
                backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
                backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                
                titleLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
                titleLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
                titleLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10),
                titleLbl.heightAnchor.constraint(equalToConstant: 20),
                
                textView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5),
                textView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
                textView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
                textView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -7),
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
