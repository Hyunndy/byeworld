//
//  TableViewController.swift
//  byeworld
//
//  Created by user on 2020/07/01.
//  Copyright © 2020 Hyunndy. All rights reserved.
//

// XCode는 UITableViewController를 쓰는 개발자들이 자주 쓰는 함수들을 주석처리 형태로 제공한다.

import UIKit

var itemsImageFile = ["커밋1.jpeg", "커밋2.jpeg", "커밋3.jpg"]
var items = ["1번 개굴", "2번 개굴", "3번 개굴"]

class TableViewController: UITableViewController {

    // 테이블 뷰
    @IBOutlet var tvListView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // naviation.item.(left/right)BarButtonItem이 활성화 되면서 cell을 edit(추가/삭제) 할 수 있다.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // 뷰가 전환될 때 호출되는 함수.
    // viewDidLoad -> viewWillAppear -> viewDidAppear -> viewWilldisAppear -> viewDidDisAppear
    // Add View -> Main View로 돌아올 때 호출되며 추가된 내용을 리스트로 보여준다.
    override func viewWillAppear(_ animated: Bool) {
        
        // 테이블 뷰를 다시 불러오는 내용
        tvListView.reloadData()
    }
    

    // MARK: - Table view data source

    // 테이블 안에 섹션의 수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 섹션 당 열의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // ~~셀에 적용하는 함수~~
    // 앞에서 선언한 변수의 내용을 << 셀에 적용 >> 하는 함수
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // identifier 가 설정된 셀을 불러온다!!!!!
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // ~~셀을 삽입 or 삭제하는 함수~~
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // 셀을 이루는 데이터 배열 삭제
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // 셀 삭제 할 때 나타나는 Delete 이름을 수정하는 함수
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    

    
    // Override to support rearranging the table view.
    // 테이블 뷰의 목록 순서 바꾸기를 할 수 있는 함수
    // 이 함수를 정의해놓으면 자동으로 셀 옆에 햄버거 아이콘이 생겨난다.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        // 이동할 아이템
        let itemToMove = items[ (fromIndexPath as NSIndexPath).row]
        // 이동할 아이템의 이미지
        let itemImageToMove = itemsImageFile[ (fromIndexPath as NSIndexPath).row ]
        
        // 이동할 아이템 삭제. 인덱스 자동으로 재정렬됨
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        // 이동ㅎㄹ 아이템의 이미지 삭제
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        
        // 삭제된 아이템을 이동할 위치로 삽입
        items.insert(itemToMove, at : (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        
    }
    
    // 세그웨이를 통한 데이터 전송 -> prepare()
    // sender의 내용을 segue의 destination 으로 보냅니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sgDetail" {
            
            // 보낼 것
            let cell = sender as! UITableViewCell
            // 인덱스 패스
            let indexPath = self.tvListView.indexPath(for: cell)
            // 세그웨이의 도착지.
            let detailView = segue.destination as! DetailViewController
            // 세그웨이의 도착지의 함수를 호출해서 보내고싶은 데이터 세팅
            detailView.receiveItem(items[ (indexPath! as NSIndexPath).row ])
            
        }
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
