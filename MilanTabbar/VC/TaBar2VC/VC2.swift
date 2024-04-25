

import UIKit

class VC2: UIViewController {

    let vC2Data = TabBar2Data.TabBar2GetData()
    
    let backImageV = CustomBackImageView()
    
    var collectionView: UICollectionView!
    
    let backView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.customBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "VC2image")
        return image
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "roulette effective\nstrategies".uppercased()
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
        
        collectionView.register(VC2CollectionViewCell.self, forCellWithReuseIdentifier: VC2CollectionViewCell.identifier)
        
 }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            backView.heightAnchor.constraint(equalToConstant: 170),
            
            imageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width/2),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.width/1.8),
            
            collectionView.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            titleLbl.topAnchor.constraint(equalTo: collectionView.topAnchor),
            titleLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLbl.widthAnchor.constraint(equalToConstant: view.frame.width - 35),
            titleLbl.heightAnchor.constraint(equalToConstant: 50),
            
        ])
     
    }
    
    func addSubView() {
        view.addSubview(backView)
        view.addSubview(imageView)
        view.addSubview(collectionView)
        collectionView.addSubview(titleLbl)
    }
    
    func createCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        layout.itemSize = CGSize(width: (view.frame.width - 30), height:  100)
        layout.sectionInset = UIEdgeInsets(top: 60, left: 0, bottom: 50, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsVerticalScrollIndicator = false
    }
   
}

extension VC2: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vC2Data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = vC2Data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VC2CollectionViewCell.identifier, for: indexPath) as! VC2CollectionViewCell
        cell.initData(obj: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = VC2Info()
        vc.descData = vC2Data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
