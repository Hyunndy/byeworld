//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var txtView: UILabel!
    
    // 페이지를 구성할 이미지 String 배열
    var images = [ "커밋1.jpeg", "커밋2.jpeg", "커밋3.jpg" ]
    
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        
        // 보라색으로 설정
        pageControl.pageIndicatorTintColor = UIColor.purple
        
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        imgView.image = UIImage(named: images[0])
        txtView.text = String(0)
    }
    
    // 페이지 컨트롤 객체에서 페이지가 변경되었을 경우의 액션 함수
    @IBAction func pageChange(_ sender: UIPageControl) {
        
        // 이미지 뷰 세팅
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
        // 텍스트 라벨 세팅
        txtView.text = String(pageControl.currentPage)
        
    }
}
