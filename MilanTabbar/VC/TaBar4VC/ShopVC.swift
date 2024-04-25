//
//  ShopVC.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 22/04/24.

import Foundation
import UIKit

class ShopVC: UIViewController {
    
    let shopData = ShopData.getShopData()
    
    let vc = GameVC()
    
    let backImage = CustomBackImageView()
    
    let backBtn = CustomBackButton()
    
    let patnisView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()
    
     lazy var titleLbl: UILabel = {
      let label = UILabel()
       label.backgroundColor = .clear
         label.text = "total: \(vc.myMoney)".uppercased()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont(name: "GillSans-Bold", size: 13)
       label.textColor = UIColor.white
       label.textAlignment = .left
       return label
   }()
    
    var coinImageView: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFit
       image.image = UIImage(named: "coin")
       return image
   }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customRed.cgColor
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.isScrollEnabled = false
        return view
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBlack
        navigationItem.hidesBackButton = true
        backImage.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        
        backBtn.createButton(view: view)
        addSubviews()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ShopTableViewCell.self, forCellReuseIdentifier: ShopTableViewCell.identifier)
        
        backBtn.button.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            
            patnisView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            patnisView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            patnisView.widthAnchor.constraint(equalToConstant: 140),
            patnisView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLbl.topAnchor.constraint(equalTo: patnisView.topAnchor),
            titleLbl.leftAnchor.constraint(equalTo: patnisView.leftAnchor, constant: 10),
            titleLbl.widthAnchor.constraint(equalToConstant: 100),
            titleLbl.bottomAnchor.constraint(equalTo: patnisView.bottomAnchor),
            
            coinImageView.topAnchor.constraint(equalTo: patnisView.topAnchor),
            coinImageView.leftAnchor.constraint(equalTo: titleLbl.rightAnchor),
            coinImageView.rightAnchor.constraint(equalTo: patnisView.rightAnchor, constant: -10),
            coinImageView.bottomAnchor.constraint(equalTo: patnisView.bottomAnchor),
            

            backView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Const.wd/4),
            
            tableView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 7),
            tableView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            tableView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -7),
           
            
        ])
    }
    
    func addSubviews() {
        view.addSubview(patnisView)
        patnisView.addSubview(titleLbl)
        patnisView.addSubview(coinImageView)
        view.addSubview(backView)
        backView.addSubview(tableView)
    }
    
    @objc func backBtnTapped() {
        print("mana: \(backView.frame.size.height)")
        navigationController?.popViewController(animated: true)
    }
}

extension ShopVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopTableViewCell.identifier, for: indexPath) as? ShopTableViewCell
        let data = shopData[indexPath.row]
        cell?.initData(obj: data)
        cell?.backgroundColor = .clear
        cell?.selectionStyle = .none
        cell?.clearBtn.tag = indexPath.row
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let numberOfRows = CGFloat(shopData.count)
        return (backView.frame.size.height - 14) / numberOfRows
    }
}

extension ShopVC: ShopTableViewDelegate {
    func useBtnTapped(_ sender: UIButton) {
        
        if (vc.myMoney - shopData[sender.tag].price) >= 0 && vc.index != sender.tag {
            for cell in tableView.visibleCells as! [ShopTableViewCell] {
                cell.clearBtn.isUserInteractionEnabled = false
            }
            
            sender.isUserInteractionEnabled = true
            sender.backgroundColor = UIColor.customBlack
            sender.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 13)
            sender.setTitle("bought".uppercased(), for: .normal)
            
            vc.index = sender.tag
            vc.myMoney -= shopData[sender.tag].price
            titleLbl.text = "total: \(vc.myMoney)".uppercased()
            
        }
    }
}
