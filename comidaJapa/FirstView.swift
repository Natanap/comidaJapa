//
//  firstView.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import UIKit

class FirstView: UIView{
    
    var foodViewModel = FoodViewModel()
    
    lazy var tableView: UITableView = {
       let view = UITableView()
        view.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.dataSource = self
        tableView.delegate = self
        addSubViews()
        setUpConstraints()
        fetchFood()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchFood() {
        let api = FoodApi()
        api.getFood { result in
            switch result {
            case .success(let model):
                self.foodViewModel = FoodViewModel(model: model)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    private func addSubViews() {
        self.addSubview(self.tableView)
    }

    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}


extension FirstView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodViewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
        cell.nameLabel.text = foodViewModel.model[indexPath.row].name
        cell.descriptionLabel.text = foodViewModel.model[indexPath.row].description
        let image = foodViewModel.model[indexPath.row].img
        if let url = URL(string: image) {
            cell.image.load(url: url )
        }
        
        return cell
    }
    
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        
                    }
                }
            }
        }
    }
}
