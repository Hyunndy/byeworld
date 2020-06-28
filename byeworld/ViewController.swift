//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 현재 시간을 나타내는 라벨
    @IBOutlet var IblCurrentTime: UILabel!
    
    // 데이트 피커에서 선택한 시간을 나타내는 라벨
    @IBOutlet var IblPickerTime: UILabel!
    
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
    
    }
    
    // 데이트 피커의 액션 함수
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        // 날짜 포매터
        let formatter = DateFormatter()
        
        // 년-월-일 시:분:초 요일
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IblPickerTime.text = "선택시간 :" + formatter.string(from: sender.date)
    }
    
    
}

