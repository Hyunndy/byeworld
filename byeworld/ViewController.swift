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

    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.

    }

    @IBAction func btnToTimePicker(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 1
        
    }
    
    @IBAction func btnToImage(_ sender: Any) {
        
        tabBarController?.selectedIndex = 2
    }
    
}
