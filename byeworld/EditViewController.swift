//
//  EditViewController.swift
//  byeworld
//
//  Created by user on 2020/07/01.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

// 프로토콜 생성
protocol EditDelegate {
    // 수정화면 -> 메인화면으로 텍스트 필드의 데이터를 보내기 위해
    func didMessageEditDone(_ controller: EditViewController, message: String)
    // 수정 화면 -> 메인화면으로 스위치 상태를 보내기 위해
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}


class EditViewController: UIViewController {

    // 라벨
    @IBOutlet var lbIWay: UILabel!
    
    // 라벨의 텍스트를 제어하기 위한 문자열 변수
    var textWayLabel: String = ""
    
    // 텍스트 필드 객체
    @IBOutlet var txMessage: UITextField!
    
    // 메인화면에서 수정된 텍스트필드의 텍스트를 받아오기 위한 변수
    var txtMessage: String = ""
    
    // 델리게이트
    var delegate: EditDelegate?
    
    // 스위치 객체
    @IBOutlet var swlsOn: UISwitch!
    var isOn = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 라벨에 ViewController의 prepare() 에서 설정한 텍스트를 넣어줌
        lbIWay.text = textWayLabel
        
        // 텍스트필드 세팅
        txMessage.text = txtMessage
        
        // 스위치 on/off 세팅
        swlsOn.isOn = isOn
        
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        
        // 메인 화면으로 돌아가기
        navigationController?.popViewController(animated: true)
        
        if(delegate != nil) {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: self.isOn)
        }
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        
        isOn = sender.isOn
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
