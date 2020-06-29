//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/06/27.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var scrollViewContainerViewWidth: NSLayoutConstraint!
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
        
        
        // Setting the ContainerView's width size for the ScrollView
        scrollViewContainerViewWidth.constant = UIScreen.main.bounds.size.width * 2
        
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Current X,Y are X:\(scrollView.contentOffset.x), Y: \(scrollView.contentOffset.y)")
        let currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        print("current page : \(currentPage)")
    }
}
