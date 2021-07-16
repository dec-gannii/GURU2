//
//  DetailController.swift
//  AlamoFireBasic
//
//  Created by 김가은 on 2021/07/09.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailController:UIViewController {
    
    var user_id: String!
    var user_info:PersonDetail!
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var registerdateLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // getData(user_id)
    }
    
    func getData(_ user_id:String) {
        let headers: HTTPHeaders = [
            "app-id": "60e7b4cea8b6363cfced26b9"
        ]
        AF.request("https://dummyapi.io/data/api/user/\(user_id)", headers: headers).responseJSON { response in
            //debugPrint(response)
            
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let decoder = JSONDecoder()
                    self.user_info = try decoder.decode(PersonDetail.self, from: jsonData)
                    self.updateInfo()
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
    func updateInfo() {
        idLabel.text = user_info.id
        nameLabel.text = "\(user_info.title) \(user_info.firstName) \(user_info.lastName)"
        genderLabel.text = user_info.gender
        birthdayLabel.text = user_info.dateOfBirth
        registerdateLabel.text = user_info.registerDate
        emailLabel.text = user_info.email
        if let address = user_info.location {
            addressLabel.text = "\(address.street), \(address.city), \(address.state), \(address.country)"
        }
        
        profileImage.af.setImage(withURL: user_info.picture)
    }
    
}

