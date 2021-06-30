//
//  ViewController.swift
//  Memo
//
//  Created by 김가은 on 2021/06/29.
//

import UIKit
import FMDB

class ViewController: UIViewController {
    var databasePath = String() // db파일 경로 저장
    var memoNumbers = 0
    var memoContent = String()
    var memoArray = Array<String>()
    
    @IBOutlet weak var memoField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDB()
    }
    
    func initDB() {
        NSLog("start")
        let fileMgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPaths[0]
        
        databasePath = docDir  +  "/memo.db"
        if !fileMgr.fileExists(atPath: databasePath) {
            // database 파일을 만들도록 하기
            let db = FMDatabase(path: databasePath) // 파일을 만들기
            if db.open() { // 파일 열기
                // table 생성, 쿼리문에 오타 주의!!
                let query = "create table if not exists memo (id integer primary key autoincrement, textMemo text)"
                if !db.executeStatements(query) {
                    NSLog("fail to create database") // 로그 구문에 해당하므로 제품으로 빌드를 하게 되면 동작하지 않음
                } else {
                    NSLog("database create success!")
                }
            }
        } else {
            NSLog("db file exists")
        }
    }
    
    @IBAction func doSave(_ sender: Any) {
        let db = FMDatabase(path: databasePath)
        if db.open() {
            try! db.executeUpdate("delete from memo", values: [])
            let query = "insert into memo (textMemo) values ('\(memoContent)')"
            if !db.executeUpdate(query, withArgumentsIn: [] ) {
                NSLog("fail to save")
            } else {
                NSLog("save success")
            }
        } else {
            NSLog("DB Connection Error")
        }
        
        if db.open() {
            let query = "select * from memo"
            memoArray = Array<String>()
            if let result = db.executeQuery(query, withArgumentsIn: []), let memo = memoField.text {
                
                while result.next() {
                    memoContent = memo
                    memoArray.append(memoContent)
                    memoNumbers = memoNumbers + 1
                }
            } else {
                NSLog("No Result")
            }
        } else {
            NSLog("DB Connection Error")
        }
        self.tableView.reloadData()
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("log1")
        return memoNumbers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("log2")
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath) as! memoCell
        cell.memoView.text = memoArray[indexPath.row]
        
        return cell
    }
}
