
import UIKit

class VC1Info: UIViewController {
    
    var descData: TabBar1Data?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBlack
        backImageV.createBackImage(view: view, named: "back1", triangleColor: UIColor.customRed)
        addSubviews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VC1InfoTableViewCell.self, forCellReuseIdentifier: VC1InfoTableViewCell.identifier)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "pop")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(backTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension VC1Info: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VC1InfoTableViewCell.identifier, for: indexPath) as! VC1InfoTableViewCell
        cell.initData(obj: descData!)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
