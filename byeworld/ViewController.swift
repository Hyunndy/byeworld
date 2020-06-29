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

    
    @IBOutlet var txtUrl: UITextField!
    

    @IBOutlet var myWebView: WKWebView!
    
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    
    // 앱 시작 시 지정된 페이지 보여주기
    func loadWebPage(_ url: String){
        
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
 
    
    // 내가 만든 뷰를 불러왔을 때 호출하는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // you usually override this method to perform additional initialization on views that were loaded from nib files.
        
        // 웹 뷰가 로딩중인지 알 수 있는 델리게이트 채택
        myWebView.navigationDelegate = self
        
        // 사용자가 지정한 페이지 보여주기
        loadWebPage("http://2sam.net")
    }
    
    // 웹 뷰가 로딩중일 때 불리는 델리게이트 함수
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        // 로딩 중이라면 인디케이터를 실행하고 화면에 나타나게 한다.
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    // 웹 뷰가 로딩이 완료되었을 때 동작하는 함수
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // 로딩이 완료되었다면 인디케이터를 종료한다.
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // 웹 뷰가 로딩을 실패 했을 때 동작하는 함수
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        // 로딩이 실패했다면 인디케이터를 종료한다.
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // File -> New -> Empty를 통해 추가한 Html 파일을 읽어들여 웹 뷰에 표기하기
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    /*
     HTML 코드를 변수에 저장하고 html 버튼을 클릭하면 변수의 내용이 HTML 형식에 맞추어 웹 뷰로 나타나게 구현
     HTML로 표현할 수 있는 모든 것은 웹 뷰를 통해 표현할 수 있다.
     */
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        
        let htmlString = "<h1> HTML String </h1> <p> String 변수를 이용한 웹 페이지 </p> <p> <a href =\"http://2sam.net\">2sam</a>으로 이동</p>"
        
        // html 문자열을 로드하는 함수
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // {{ 미리 정해놓은 사이트로 이동
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    // }}
    
    // http:// 프로토콜 문자열을 자동으로 삽입하는 함수
    func checkUrl(_ url: String) -> String {
        
        var strUrl = url
        
        // 해당 접두사가 있는지 없는지 검사하는 함수
        let flag = strUrl.hasPrefix("http://")
        if(!flag) {
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }
    
    // 사용자가 텍스트필드에 입력한 Url로 이동하기
    @IBAction func btnGoUrl(_ sender: UIButton) {
        
        // 내부 프로토콜까지 추가한 최종 URL!
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }

    // 웹 페이지 로딩 중지
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    // 웹 페이지 재로딩
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    // 이전 웹 페이지
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    // 다음 웹페이지로 이동
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

