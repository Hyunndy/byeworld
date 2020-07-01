//
//  DetailViewController.swift
//  byeworld
//
//  Created by user on 2020/07/01.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var IbIItem: UILabel!
    
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        IbIItem.text = receiveItem
    }
    

    func receiveItem(_ item: String) {
        receiveItem = item
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
