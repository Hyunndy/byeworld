//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 추가 시킨 아웃렛 변수
    @IBOutlet var IblHello: UILabel!
    @IBOutlet var IBOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 추가 시킨 액션 함수
    // 버튼을 누르면 적용된다.
    @IBAction func btnSend(_ sender: UIButton) {
        
        IblHello.text = "Hello," + IBOutlet.text!
    }
}

