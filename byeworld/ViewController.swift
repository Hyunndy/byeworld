//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    // 이미지 뷰
    @IBOutlet var imgView: UIImageView!
    
    // 버튼
    @IBOutlet var btnResize: UIButton!
    
    // 버튼 클릭 할건지 안할건지
    var isZoom: Bool = false
    
    // 이미지를 담을 객체 -> 옵셔널 변수로 선언
    var imgOn: UIImage?
    var imgOff: UIImage!
    
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
        
        // 옵셔널 변수에 래핑
        imgOn = UIImage(named: "커밋1.jpeg")
        imgOff = UIImage(named: "커밋2.jpeg")
        
        imgView.image = imgOn
        
        btnResize.setTitle("포커스 받는 중", for: .focused)
         
    }
    

    // 버튼 객체의 액션 함수
    // 버튼을 누르면 이미지뷰의 스케일 값을 리사이징한다.
    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        // 새롭게 세팅될 가로, 세로를 계산해준다.
        if(isZoom) {
            
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            
            // Sets the title to use for the specified state.
            btnResize.setTitle("확대", for: .normal)
            
        } else {
            
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            
             btnResize.setTitle("축소", for: .normal)
        }
        
        isZoom = !isZoom
        
        // 프레임 사이즈 세팅
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
    // 스위치 객체의 액션 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        if(sender.isOn) {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

