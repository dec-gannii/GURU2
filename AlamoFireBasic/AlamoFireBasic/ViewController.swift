//
//  ViewController.swift
//  AlamoFireBasic
//
//  Created by 김가은 on 2021/07/09.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    var person_data = [PersonInfo]()
    @IBOutlet weak var personCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        let headers: HTTPHeaders = [
            "app-id": "60e7b4cea8b6363cfced26b9"
        ]
        AF.request("https://dummyapi.io/data/api/user?limit=10", headers: headers).responseJSON { response in
            //debugPrint(response)
            
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let decoder = JSONDecoder()
                    let dummy_data = try decoder.decode(DummyData.self, from: jsonData)
                    self.person_data = dummy_data.data
                    self.personCollectionView.reloadData()
                    print("finish parsing")
                } catch {
                    debugPrint(error)
                }
            case .failure(let data):
                print("fail")
            default:
                return
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.personCollectionView.indexPathsForSelectedItems?.first {
            let person_info = person_data[indexPath.row]
            print(person_info.id)
            if let vc = segue.destination as? DetailController {
                vc.user_id = person_info.id
            }
        }
        
    }
    
}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return person_data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "personCell", for: indexPath) as! PersonCell
        
        let data = person_data[indexPath.row]
        if let url = data.picture {
            cell.profileImage.af.setImage(withURL: url)
        }
        
        cell.idLabel.text = data.id
        cell.nameLabel.text = data.firstName
        cell.emailLabel.text = data.email
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 5
        return cell
    }
    
    
}

extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 20) / 3
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
}

