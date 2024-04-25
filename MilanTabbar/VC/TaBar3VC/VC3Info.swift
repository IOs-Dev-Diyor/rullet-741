//
//  VC3Info.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 18/04/24.
//

import UIKit

class VC3Info: UIViewController {
    
    var descData: TabBar3Data?

    let backImageV = CustomBackImageView()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = 300
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
        label.text = "Clever Strategies for Managing Your Roulette Funds".uppercased()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-Bold", size: 20)
        label.numberOfLines = 3
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let borderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 700, width: 400, height: 900)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.addBorder(edge: .left, color: .red, thickness: 2.0)
        view.addBorder(edge: .top, color: .red, thickness: 2.0)
        return view
    }()
    
    let descImageView: UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "desc3icon1")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBlack
        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        addSubView()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VC3InfoTableViewCell.self, forCellReuseIdentifier: VC3InfoTableViewCell.identifier)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "pop")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(backTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            titleLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            titleLbl.heightAnchor.constraint(equalToConstant: 70),

            descImageView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            descImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descImageView.widthAnchor.constraint(equalToConstant: 100),
            descImageView.heightAnchor.constraint(equalToConstant: 100),
            
            borderView.topAnchor.constraint(equalTo: descImageView.topAnchor, constant: 50),
            borderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            borderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            borderView.heightAnchor.constraint(equalToConstant: view.frame.height),
            
        ])
    }
    
    func addSubView() {
        view.addSubview(titleLbl)
        view.addSubview(borderView)
        view.addSubview(descImageView)
        view.addSubview(tableView)
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: descImageView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension VC3Info: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descData?.descData.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = descData?.descData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: VC3InfoTableViewCell.identifier, for: indexPath) as! VC3InfoTableViewCell
        cell.titleLbl.text = obj?.title
        cell.textView.text = obj?.text
        cell.numberLbl.text = "\(indexPath.row + 1)"
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension UIView {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor

        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width/2 - 60, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }

        layer.addSublayer(border)
    }
}
