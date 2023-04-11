//
//  ViewController.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import UIKit

class ViewController: UIViewController {

    var fistView = FirstView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fistView = FirstView()
        self.view = fistView
        view.backgroundColor = .red
    }


}

