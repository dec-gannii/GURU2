//
//  introViewController.swift
//  ScreenChangeExample
//
//  Created by 김가은 on 2021/07/01.
//

import UIKit

class IntroViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let storyboard = self.storyboard {
            let vc = storyboard.instantiateViewController(identifier: "firstScreen")
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil) // 뜨자마자 띄워짐
        }
    }
}
