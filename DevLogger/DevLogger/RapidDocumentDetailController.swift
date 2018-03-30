//
//  RapidDocumentDetailController.swift
//  ATC
//
//  Created by Orbysol on 3/24/18.
//  Copyright © 2018 vaco. All rights reserved.
//

import UIKit

class RapidDocumentDetailController: UIViewController {

    var selectedPathUrl : URL?
    var titleStr : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleStr
        let webView:UIWebView = UIWebView(frame: CGRect(x:0, y:100, width:UIScreen.main.bounds.width-20, height:UIScreen.main.bounds.height-100))
        webView.loadRequest(URLRequest(url:selectedPathUrl!))
        self.view.addSubview(webView)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
