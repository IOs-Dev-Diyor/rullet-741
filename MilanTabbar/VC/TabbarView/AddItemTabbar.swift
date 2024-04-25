//
//  ViewController.swift
//  MilanTabbar
//
//  Created by mac on 20/10/21.
//

import UIKit

class AddItemTabbar: UIViewController {
    
    //MARK: VAR
    var tabView = UIView()
    var stackView = UIStackView()
    var tabs = [StackItemView]()
    let tabBarHeight:CGFloat = 64
    
    lazy var tabModels: [TabStackItemModel] = {
        return [
            TabStackItemModel(title: "Croupier", image: "tabbar1"),
            TabStackItemModel(title: "Strategies", image: "tabbar2"),
            TabStackItemModel(title: "Facts", image: "tabbar3"),
            TabStackItemModel(title: "Simulator", image: "tabbar4"),
            TabStackItemModel(title: "Quizes", image: "tabbar5")
        ]
    }()
    
    var selectedIndex: Int = 0
    var previousIndex: Int = 0
    
    var viewControllers = [UIViewController]()
    
    let firstVC = VC1()
    let secondVC = VC2()
    let thirdVC = VC3()
    let fourthVC = VC4()
    let fiweVC = VC5()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrateTabView()
        navigationItem.hidesBackButton = true
        viewControllers = [firstVC,secondVC,thirdVC,fourthVC, fiweVC]
        setupTabs()
        moveToVc(index: 0)
    }
    
    func genrateTabView() {
        tabView.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.1176470588, blue: 0.1607843137, alpha: 1)
        view.addSubview(tabView)
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.heightAnchor.constraint(equalToConstant: tabBarHeight).isActive = true
        self.view.leadingAnchor.constraint(equalTo: tabView.leadingAnchor, constant: -10).isActive = true
        self.view.trailingAnchor.constraint(equalTo: tabView.trailingAnchor, constant: 10).isActive = true
        self.view.bottomAnchor.constraint(equalTo: tabView.bottomAnchor, constant: 15).isActive = true
        tabView.layer.cornerRadius = tabBarHeight / 2
        genrateStackView()
    }
    
    func genrateStackView() {
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        tabView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.tabView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        self.tabView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -10).isActive = true
        self.tabView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10).isActive = true
        self.tabView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupTabs() {
        for _ in 0..<tabModels.count {
            tabs.append(StackItemView.newInstance)
        }
        
        for (index, model) in self.tabModels.enumerated() {
            let tabView = self.tabs[index]
            model.isSelected = index == 0
            tabView.item = model
            tabView.delegate = self
            self.stackView.addArrangedSubview(tabView)
        }
    }
    
}


extension AddItemTabbar: StackItemViewDelegate {
    
    func handleTap(_ view: StackItemView) {
        self.tabs[self.selectedIndex].isSelected = false
        view.isSelected = true
        self.selectedIndex = self.tabs.firstIndex(where: { $0 === view }) ?? 0
        
        print(self.selectedIndex)
        moveToVc(index: self.selectedIndex)
    }
    
    func moveToVc(index : Int = 0) {
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[selectedIndex]
        vc.view.frame = UIApplication.shared.windows[0].frame
        vc.didMove(toParent: self)
        self.addChild(vc)
        self.view.addSubview(vc.view)
        self.view.bringSubviewToFront(tabView)
    }
    
}
