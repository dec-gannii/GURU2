//
//  ViewController.swift
//  UIBasic
//
//  Created by 김가은 on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {

    /*
     UI 요소들을 연결하는 방식
     IBOutlet : UI 요소를 변수와 연결하는 것
     IBAction : UI 요소의 이벤트를 연결하는 것
     */
    
    
    @IBOutlet weak var label1: UITextField!
    @IBOutlet weak var label2: UITextField!
    // 소스코드 직접 수정 시 재연결 필수!!
    // 느낌표 붙어있으면 무조건 값이 존재할 변수들에 해당
    
    let numberFormatter:NumberFormatter = {
       // 초기화 과정 거치게 됨
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0 // 정수인 경우 소수점 없이
        nf.maximumFractionDigits = 2 // 소수점 두 자리까지
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("앱 화면이 나타납니다.")
    }
    
    @IBAction func doConvert(_ sender: Any) {
        // print("buttonClicked") // 문자열 표기 시 쌍따옴표만 사용 가능
        //optional 사용하려면 if let 구문 사용 (unwraping)
        if let value1 = label1.text, let number1 = Double(value1) {
            // 섭씨 * 1.8 + 32 = 화씨
            let fahrenheit = number1 * 1.8 + 32
            label2.text = numberFormatter.string(from: NSNumber(value: fahrenheit)) //숫자륾 문자열로 변환하는 방법
                // 소수점 자리수 고정하는 방법 : numberFormatter 사용
            label1.resignFirstResponder() // 현재 키보드를 눌러도 응답 X를 의미 -> 키보드 사라지도록 함
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        label1.resignFirstResponder()
        label2.resignFirstResponder()
    }
    
}

