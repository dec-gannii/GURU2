//
//  ThirdViewController.swift
//  ScreenChangeExample
//
//  Created by 김가은 on 2021/07/01.
//

import UIKit

class ThirdViewController:UIViewController {
    @IBOutlet weak var label: UILabel!
    var label_text:String! // label_text = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) { // viewdidAppear도 가능 차이는 있으나 코드 내용은 동일하게 사용
        self.label.text = self.label_text
    }
    
    @IBAction func goBack(_ sender: Any) {
        if let preVC = self.presentingViewController as? UIViewController {
            preVC.dismiss(animated: false, completion: nil) // 현재 보고 있는 화면 없앨 때 필요
        }
    }
}
