//
//  TempVC.swift
//  MilanTabbar
//
//  Created by mac on 20/10/21.
//

import UIKit

class TempVC: UIViewController {
    
    
    var tabView = UIView()
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrateTabView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func genrateTabView() {
        view.addSubview(tabView)
        tabView.backgroundColor = .red
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        self.view.leadingAnchor.constraint(equalTo: tabView.leadingAnchor, constant: -10).isActive = true
        self.view.trailingAnchor.constraint(equalTo: tabView.trailingAnchor, constant: 10).isActive = true
        self.view.bottomAnchor.constraint(equalTo: tabView.bottomAnchor, constant: 10).isActive = true
        
        genrateStackView()
    }
    
    func genrateStackView() {
        tabView.addSubview(stackView)
        stackView.backgroundColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.tabView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        self.tabView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -10).isActive = true
        self.tabView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10).isActive = true
        self.tabView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
    }
}
