//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 타이머가 구동되면 실행할 함수를 지정하는 역할
    let timeSelector: Selector = #selector(ViewController.updateTime)
    // 타이머의 간격 값 -> 1초
    let interval = 1.0
    // 타이머가 설정한 간격대로 실행되는지 확인하는 변수
    var count = 0
    
    var alarmTime: String = "0"
    
    
    // 현재 시간을 나타내는 라벨
    @IBOutlet var IblCurrentTime: UILabel!
    
    // 데이트 피커에서 선택한 시간을 나타내는 라벨
    @IBOutlet var IblPickerTime: UILabel!
    
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
        
        // 타이머를 설정하기 위해 사용하는 함수
        // 1. 타이머 간격, 2. 동작될 view 3. 타이머가 구동될 때 실행할 함수 4. 사용자 정보 5. 반복 여부
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    
    }
    
    // 데이트 피커의 액션 함수
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        // 날짜 포매터
        let formatter = DateFormatter()
        
        // 년-월-일 시:분:초 요일
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IblPickerTime.text = "선택시간 :" + formatter.string(from: sender.date)
        
        // 알람 타임
        alarmTime = formatter.string(from: sender.date)
    }
    
    // 타이머가 구동될 때 구동할 함수.
    // selector 변수에서 정의한 함수 이름과 같아야한다.
    // scheduledTimer() 에서 인자로 넘겨준 selector 변수와 연결된 함수가 타이머에서 실행된다.
    // swift4에서는 #selector()의 인자로 사용될 메서드를 선언할 때 오브젝트c와의 호환성을 위해 함수 앞에 반드시 @objc 키워드를 붙여야한다.
    @objc func updateTime() {

        // 현재 시간을 나타내는 함수
        let date = NSDate()
        
        // 시간을 가져올 수 있는 객체(nsdate(), timepicker 등)를 통해 가져온 시간 정보를 나타낼 포맷을 정하는 객체
        let formattter = DateFormatter()
        formattter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        IblCurrentTime.text = "현재시간 :" + formattter.string(from: date as Date)
        
        if(formattter.string(from: date as Date) == alarmTime) {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    
}

