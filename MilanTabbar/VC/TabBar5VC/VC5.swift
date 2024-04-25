//
//  FiweViewController.swift
//  MilanTabbar
//
//  Created by Diyorbek Xikmatullayev on 16/04/24.
//

import UIKit
class VC5: UIViewController {
    
    let vC5Data = TabBar5Data.getTabBar5Data()
    
    let backImageV = CustomBackImageView()
    
    var quiz1Data = QuizData.getQuiz1Data()
    var quiz2Data = QuizData.getQuiz2Data()
    var quiz3Data = QuizData.getQuiz3Data()
    
    var collectionView: UICollectionView!
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "roulette quizes".uppercased()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 3
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBlack
        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        createCollectionView()
        addSubView()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(VC5CollectionViewCell.self, forCellWithReuseIdentifier: VC5CollectionViewCell.identifier)
        
 }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            titleLbl.topAnchor.constraint(equalTo: collectionView.topAnchor),
            titleLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLbl.widthAnchor.constraint(equalToConstant: view.frame.width - 35),
            titleLbl.heightAnchor.constraint(equalToConstant: 20),
            
        ])
     
    }
    
    func addSubView() {
        view.addSubview(collectionView)
        collectionView.addSubview(titleLbl)
    }
    
    func createCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (view.frame.width - 30), height:  240)
        layout.sectionInset = UIEdgeInsets(top: 40, left: 0, bottom: 60, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
  
}

extension VC5: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vC5Data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = vC5Data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VC5CollectionViewCell.identifier, for: indexPath) as! VC5CollectionViewCell
        cell.initData(obj: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = StartVC()
        vc.startDesc = vC5Data[indexPath.row]
        switch indexPath.row {
        case 0:
            vc.chooseQuizData = quiz1Data
        case 1:
            vc.chooseQuizData = quiz2Data
        case 2:
            vc.chooseQuizData = quiz3Data
            
        default:
            fatalError("no cell")
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
