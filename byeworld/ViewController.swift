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
    
    // 현재 이미지 번호
    var curImgNum: Int = 0
    
    // 전체 이미지 번호
    let maxImgNum: Int = 5
    
    // 이미지들
    var imgOn: UIImage?
    var imgOff:UIImage?
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
    
        // 이미지 래핑
        imgOn = UIImage(named: "커밋1.jpeg")
        imgOff = UIImage(named: "커밋2.jpeg")
        
        imgView.image = imgOn
    }
    
    // 다음 버튼 클릭
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
        if(curImgNum < maxImgNum) {
            
            curImgNum += 1
            
            if(imgView.image == imgOn) {
                imgView.image = imgOff
            }else {
                imgView.image = imgOn
            }
        }
    }
    
    // 이전 버튼 클릭
    @IBAction func prevBtnClicked(_ sender: UIButton) {
        if(curImgNum > 0) {
             
             curImgNum -= 1
             
             if(imgView.image == imgOn) {
                 imgView.image = imgOff
             }else {
                 imgView.image = imgOn
             }
         }
    }
}

