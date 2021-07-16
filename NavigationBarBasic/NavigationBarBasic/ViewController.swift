//
//  ViewController.swift
//  NavigationBarBasic
//
//  Created by 김가은 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        //Navigation controller 숨기기
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // 이어진 화면에서의 navigation controller가 모두 숨겨짐
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 메인에서 다른 화면으로 넘어갈 때
        // (viewWillApper의 단점 보완 가능 -> 첫번째 화면에서만 navigation controller 숨기기 가능)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // navigationbar의 타이틀 숨기기
        self.navigationItem.title = ""
    }

}

