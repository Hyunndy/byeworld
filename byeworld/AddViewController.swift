//
//  AddViewController.swift
//  byeworld
//
//  Created by user on 2020/07/01.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        // 텍스트 필드에 적은 내용과, 무조건적으로 추가하는 이미지
        items.append(tfAddItem.text!)
        itemsImageFile.append("루피.jpg")
        tfAddItem.text = ""
        
        // 버튼 누르면 자동으로 메인화면으로 돌아가게
        navigationController?.popViewController(animated: true)
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
