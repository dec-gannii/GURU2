//
//  SecondViewController.swift
//  ScreenChangeExample
//
//  Created by 김가은 on 2021/07/01.
//

import UIKit

class SecondViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ThirdViewController {
            destination.label_text = "test"
        }
    }
}
