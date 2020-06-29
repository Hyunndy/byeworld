//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    // 이미지 뷰 아웃렛 변수
    @IBOutlet var kermitImg: UIImageView!
    
    let imgOn = UIImage(named: "커밋1.jpeg")
    let imgOff = UIImage(named: "커밋2.jpeg")
    let imgRemove = UIImage(named: "커밋3.jpg")
    
    var isRampOn: Bool = true
    
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
        
        kermitImg.image = imgOn
    }
    
    // 켜기 버튼 눌렀을 때 일어나는 액션 함수
    @IBAction func btnImgOn(_ sender: UIButton) {
        
        // 이미 전구가 켜져있는 경우
        if(isRampOn) {
            
            /* 전구가 켜져있다는 alert 보냄 */
            // 1. UIAlertController 생성
            let imgOnAlert = UIAlertController(title: "경고!", message: "현재 On 상태 입니다.", preferredStyle: UIAlertController.Style.alert)
            
            // 2. UIAlertAction을 생성
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            // 3. 생성된 onAction 을 alert에 추가한다.
            imgOnAlert.addAction(onAction)
            
            // 4. present 메서드 실행 실행
            present(imgOnAlert, animated: true, completion: nil)
            
        }
        // 전구가 꺼져 있는 경우
        else {
            kermitImg.image = imgOn
            isRampOn = true
        }
        
    }
    
    
    @IBAction func btnImgOff(_ sender: UIButton) {
        
        if(isRampOn) {
            
            let imgOffAlert = UIAlertController(title: "램프 끄기", message: "커밋2로 전환할까요?", preferredStyle: UIAlertController.Style.alert)
            
            // 액션에 해당하는 작업을 handler 에 넣어준다.
            // self 를 넣어줘야 에러가 발생하지 않으며, 익명 함수(클로저) 형태이다.
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default,
                                          handler: { ACTION -> () in
                                            self.kermitImg.image = self.imgOff
                                            self.isRampOn = false })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            imgOffAlert.addAction(offAction)
            imgOffAlert.addAction(cancelAction)
            
            present(imgOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnImgRemove(_ sender: UIButton) {
        
        let imgRemoveAlert = UIAlertController(title: "램프 제거", message: "커밋3로 전환할까요?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아뇨 전 커밋2로 전환할래요", style: UIAlertAction.Style.default, handler: { ACTION in self.kermitImg.image = self.imgOff
            self.isRampOn = false
        })
        
        let onAction = UIAlertAction(title: "아뇨 전 커밋1로 전환할래요", style: UIAlertAction.Style.default, handler: { ACTION in self.kermitImg.image = self.imgOn
            self.isRampOn = true
        })
        
        let removeAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.kermitImg.image = self.imgRemove
            self.isRampOn = false
        })
        
        imgRemoveAlert.addAction(offAction)
        imgRemoveAlert.addAction(onAction)
        imgRemoveAlert.addAction(removeAction)
        
        present(imgRemoveAlert, animated: true, completion: nil)
    }
    
}

