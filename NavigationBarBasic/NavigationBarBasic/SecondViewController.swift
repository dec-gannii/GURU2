//
//  SecondViewController.swift
//  NavigationBarBasic
//
//  Created by 김가은 on 2021/07/01.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Test2"
    }
}
