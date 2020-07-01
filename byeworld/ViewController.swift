//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, EditDelegate {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtMessage: UITextField!
    
    let images = [UIImage(named: "lamp_on.png"), UIImage(named: "lamp_off.png")]
    var isOn: Bool = true
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.

        // 켜져있음
        imgView.image = images[0]
        
    }
    
    // prepare() 함수. 해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 세그웨이의 도착 뷰 컨트롤러를 EditViewController로 선언
        let editViewController = segue.destination as! EditViewController
        
        // 버튼을 클릭한 경우
        if segue.identifier == "editButton" {
            editViewController.textWayLabel = "segue : use button"
        }
        // 바 버튼을 클릭한 경우
        else if segue.identifier == "editBarButton" {
            editViewController.textWayLabel = "segue : use bar button"
        }
        
        // 수정화면으로 메인화면의 텍스트 필드 값을 던짐
        editViewController.txtMessage = txtMessage.text!
        
        
        // 쟤의 델리게이트를 받는애가 나라고
        editViewController.delegate = self
        
        // 스위치 객체 선언
        editViewController.isOn = isOn
    }
    
    // editViewController 에서 생성한 프로토콜을 채택. 프로토콜 구현
   func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
   }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = images[0]
            self.isOn = isOn
        } else {
            imgView.image = images[1]
            self.isOn = isOn
        }
    }
    
}
