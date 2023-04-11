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
        addSubViews()
        setUpConstraints()
        fetchFood()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchFood() {
        let api = FodApi()
        api.fecthData()
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


extension FirstView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath)
        return cell
    }
    
}
