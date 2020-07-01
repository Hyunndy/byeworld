//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/07/01.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var imgOn: UIImageView!
    @IBOutlet var imgRight: UIImageView!
    @IBOutlet var imgLeft: UIImageView!
    @IBOutlet var imgDown: UIImageView!
    
    var numOn = 0, numDown = 0, numRight = 0, numLeft = 0
    
    // n번의 터치에서만 먹히게 상수 선언
    let numOfTouches = 2
    
    
    @IBOutlet var numViewOn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numViewOn.text = String(numOn)
        
        // 스와이프 제스처 - 1번 전용
        // 1. UISwipeGestureRecognizer 클래스 상수 선언
        // 2. direction 속성에 원하는 방향 설정
        // 3. 뷰 객체의 addGestureRecogNizer 메서드를 사용해 원하는 방향의 스와이프 제스처를 등록하여 인식
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeDown.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRight)
        
        // 스와이프 제스쳐 - n번 전용
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRightMulti)
        
    }
    
    // 스와이프 제스처 - 1번 사용
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                numOn += 1
                numViewOn.text = String(numOn)
            case UISwipeGestureRecognizer.Direction.down:
                numDown += 1
            case UISwipeGestureRecognizer.Direction.left:
                numLeft += 1
            case UISwipeGestureRecognizer.Direction.right:
                numRight += 1
            
            default:
                break
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                numOn += 2
                numViewOn.text = String(numOn)
            case UISwipeGestureRecognizer.Direction.down:
                numDown += 1
            case UISwipeGestureRecognizer.Direction.left:
                numLeft += 1
            case UISwipeGestureRecognizer.Direction.right:
                numRight += 1
            
            default:
                break
            }
        }
        
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
