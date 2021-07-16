//
//  ViewController.swift
//  RealtimeDatabase
//
//  Created by 김가은 on 2021/07/16.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    var refHandle: DatabaseHandle!
    var ref2: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // FMDB
        /*
         1. 데이터베이스가 저장될 파일을 만든다
         2. 데이터베이스에 연결
         3. 데이터베이스 초기화
         4. 내용 수정, 기록, 삭제
         */
        
        ref = Database.database().reference()
        ref.child("users/1122334455/username").setValue(["test":"bbbb", "date":001220]){
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                let alertVC = UIAlertController(title: "Complete", message: "Data Saving Complete", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                print("Data saved successfully!")
            }
        }
        //        ref.child("users/1122334455/username").setValue(["test":"aaaa"])
        ref.child("users/1122334455/username").updateChildValues(["test":"aaaa"])
        // setValue는 업데이트의 의미가 아님
        
        // 비동기
        // 순차, 분기, 반복
        // 1 -> 2 -> 3 -> 4 순서로 실행됨
        // 바뀌면 전체 데이터를 다 가져온다
        ref2 = ref.child("users/1122334455")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 화면이 나타나기 직전에 관찰자 설정
        print("관찰자 등록")
        refHandle = ref2.observe(DataEventType.value, with: { snapshot in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            print(postDict)
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("관찰자 삭제")
        // 화면이 사라지고 나면 관찰자 삭제
        // 업데이트 항목을 계속 끊김 없이 감시하고 싶을 때 사용
        ref2.removeObserver(withHandle: refHandle)
    }
    
    @IBAction func pressBtn(_ sender: UIButton) {
        print("buttonPressed")
        // 내가 어떤 액션을 취하거나 특정 순간에 한 번만 데이터를 불러오고 싶을 때
        ref2.observeSingleEvent(of: .value) { snapshot in
            let data = snapshot.value as? [String:AnyObject] ?? [:]
            print(data)
        }
    }
    
    @IBAction func removeData(_ sender: UIButton) {
        print("removePressed")
        ref.child("users/1122334455/username").child("date").removeValue(){
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                let alertVC = UIAlertController(title: "Complete", message: "Data removing Complete", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                print("Data removed successfully!")
            }
        }
    }
}

