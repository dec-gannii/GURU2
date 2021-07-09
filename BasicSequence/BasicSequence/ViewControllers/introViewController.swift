//
//  introViewController.swift
//  BasicSequence
//
//  Created by 김가은 on 2021/07/01.
//

import UIKit
import SwiftyGif

class IntroViewController: UIViewController {
    @IBOutlet weak var intro_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            // 매뉴얼 페이지 참고할 것
            let gif = try UIImage(gifName: "59.gif")
            self.intro_image.setGifImage(gif, loopCount: 1)
            self.intro_image.delegate = self
        } catch {
            NSLog("can't play the gif")
        }
        
        // 로딩이 필요한 정보가 있다면 이 때 로드를 완료하고 화면 전환
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 몇 초 후에 화면을 전환하겠다
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
            self.goMainView() // self를 명시해줘야 함
        }
    }
}

extension IntroViewController:SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        // gif 실행이 멈춰지도록 함
        print ("gif Stopped")
    }
    
    func goMainView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainView"){
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
