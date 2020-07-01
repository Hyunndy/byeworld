//
//  AddViewController.swift
//  byeworld
//
//  Created by user on 2020/07/01.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // 이미지 피커뷰
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var imgView: UIImageView!
    
    var imageArray = [UIImage?]()
    var pickedImg: Int?
    
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<itemsImageFile.count {
            
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        
        imgView.image = imageArray[0]
        pickedImg = 0
    }
    
    // 피커 뷰 컴포넌트 수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 피커 뷰 갯수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    

    // 피커 뷰의 각 row 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
           let imageView = UIImageView(image: imageArray[row])
           imageView.frame = CGRect(x:0, y:0, width: 100, height: 150)
           return imageView
    }
 
    
    // 피커 뷰가 선택되었을 때 실행
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = imageArray[row]
        pickedImg = row
    }
    
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        // 텍스트 필드에 적은 내용과, 무조건적으로 추가하는 이미지
        items.append(tfAddItem.text!)
        itemsImageFile.append(itemsImageFile[pickedImg!])
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
