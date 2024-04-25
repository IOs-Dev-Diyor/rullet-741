//
//  ShopTableViewCell.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 22/04/24.
//

import UIKit

protocol ShopTableViewDelegate: AnyObject {
    func useBtnTapped(_ sender: UIButton)
}

class ShopTableViewCell: UITableViewCell {
    
    static let identifier = "ShopTableViewCell"
    
    var delegate: ShopTableViewDelegate?
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.274715756, green: 0.3030321756, blue: 0.3348620278, alpha: 0.4037406871)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    let clearBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
    
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!
    var imageView4: UIImageView!
    
    let patnisView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var priceLbl: UILabel = {
      let label = UILabel()
       label.backgroundColor = .clear
       label.text = "100"
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont(name: "GillSans-Bold", size: 18)
       label.textColor = UIColor.white
       label.textAlignment = .center
       return label
   }()
    
    var coinImageView: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFit
       image.image = UIImage(named: "coin")
       return image
   }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBackView()
        setupTitleLbl()
        setupStackView()
        sutupPriceView()
        addImageViewsToStackView()
        
        clearBtn.addTarget(self, action: #selector(didTapUseBtn(_ :)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapUseBtn(_ sender: UIButton) {
        delegate?.useBtnTapped(sender)
    }
    
    func setupTitleLbl() {
        backView.addSubview(titleLbl)
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            titleLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            titleLbl.widthAnchor.constraint(equalToConstant: Const.wd*2.5/11),
            titleLbl.heightAnchor.constraint(equalToConstant: Const.wd/11 ),
        ])
        
    }
    
    func sutupPriceView() {
        
        contentView.addSubview(patnisView)
        patnisView.addSubview(priceLbl)
        patnisView.addSubview(coinImageView)
        patnisView.addSubview(clearBtn)
        
        NSLayoutConstraint.activate([
            patnisView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            patnisView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            patnisView.widthAnchor.constraint(equalToConstant: Const.wd*2.5/11),
            patnisView.heightAnchor.constraint(equalToConstant: Const.wd/12),
            
            priceLbl.centerYAnchor.constraint(equalTo: patnisView.centerYAnchor),
            priceLbl.leftAnchor.constraint(equalTo: patnisView.leftAnchor, constant: 15),
            priceLbl.widthAnchor.constraint(equalToConstant: Const.wd*1.2/12),
            priceLbl.heightAnchor.constraint(equalToConstant: Const.wd/12),
            
            coinImageView.centerYAnchor.constraint(equalTo: patnisView.centerYAnchor),
            coinImageView.leftAnchor.constraint(equalTo: priceLbl.rightAnchor, constant: 2),
            coinImageView.widthAnchor.constraint(equalToConstant: 22),
            coinImageView.heightAnchor.constraint(equalToConstant: 22),
            
            clearBtn.topAnchor.constraint(equalTo: patnisView.topAnchor),
            clearBtn.leftAnchor.constraint(equalTo: patnisView.leftAnchor),
            clearBtn.rightAnchor.constraint(equalTo: patnisView.rightAnchor),
            clearBtn.bottomAnchor.constraint(equalTo: patnisView.bottomAnchor),
        ])
    
//        clearBtn.backgroundColor = .red
    }
    
    func setupBackView() {
        
        contentView.addSubview(backView)
        
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
        ])
        
    }
    
    private func setupStackView() {
        
        backView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            stackView.widthAnchor.constraint(equalToConstant: Const.wd*4/11 + 20),
            stackView.heightAnchor.constraint(equalToConstant: Const.wd/11),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    private func addImageViewsToStackView() {
        imageView1 = createImageView()
        imageView2 = createImageView()
        imageView3 = createImageView()
        imageView4 = createImageView()
        
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        stackView.addArrangedSubview(imageView3)
        stackView.addArrangedSubview(imageView4)
    }
    
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: Const.wd/11).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Const.wd/11).isActive = true
        return imageView
    }
    
    func initData(obj: ShopData) {
        titleLbl.text = obj.title
        priceLbl.text = "\(obj.price)"
        imageView1.image = UIImage(named: obj.imageNames[0])
        imageView2.image = UIImage(named: obj.imageNames[1])
        imageView3.image = UIImage(named: obj.imageNames[2])
        imageView4.image = UIImage(named: obj.imageNames[3])
    
    }
}
