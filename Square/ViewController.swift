//
//  ViewController.swift
//  Square
//
//  Created by 김가은 on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var areaField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var widthField: UITextField!
    
    let numberFormatter:NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func areaCalculation(_ sender: Any) {
        if let widthText = widthField.text, let width = Double(widthText), let heightText = heightField.text, let height = Double(heightText) {
            let area = width * height
            areaField.text = numberFormatter.string(from: NSNumber(value: area))
        }
        view.endEditing(true)
    }
    
    @IBAction func textFieldFinishEdit(_ sender: UITextField) {
        sender.resignFirstResponder()
        // 엔터 치면 키보드 사라짐
    }
    
    @IBAction func textEndEditing(_ sender: Any) {
        view.endEditing(true)
        // 현재 뷰의 에디팅을 끝내므로 키보드 사라짐
    }
    
}

