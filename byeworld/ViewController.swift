//
//  ViewController.swift
//  byeworld
//
//  Created by user on 2020/07/01.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 코드에서 오토레이아웃을 정의할 때는 명시적으로 false해줘야 한다.
        // 오토레이아웃을 정의하기 전 뷰를 유연하게 표현할 수 있도록 오토리사이징 마스크를 사용했기 때문에,
        // 명시적으로 끄지 않으면 오토리사이징마스크의 제약조건과 충돌할 수 있다.
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 제약사항을 코드에서 정할 때 앵커를 이용할 수 있다.
        var constraintX: NSLayoutConstraint
        constraintX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        constraintX.isActive = true
        
        var constraintY: NSLayoutConstraint
        constraintY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        constraintY.isActive = true
        
        // label의 x축을 버튼의 것과 맞춘다.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        /*
         레이블의 수평 중앙을 버튼의 수평 중앙 앵커를 기준으로 제약을 생성한 후,
         레이블의 하단 앵커를 버튼의 상단 앵커로부터 10만큼의 거리를 두도록 합니다.
         (상단 앵커기준으로 위로의 거리는 부호가 - 라는 점을 주목하세요.)
         */
        
        
        var buttonConstraintX: NSLayoutConstraint
        buttonConstraintX = label.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        buttonConstraintX.isActive = true
        
        // label을 버튼의 탑 자리에서 -10에 배치한다.
        var topConstraint: NSLayoutConstraint
        // label을 버튼 위로
        topConstraint = label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10)
        // 버튼을 label 위로
        //topConstraint = label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10)
        topConstraint.isActive = true
        
        var widthConstraint: NSLayoutConstraint
        widthConstraint = label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 2.0)
        widthConstraint.isActive = true
        
        label.backgroundColor = UIColor.brown
        button.backgroundColor = UIColor.red
        
    }

}
