//
//  WriteViewController.swift
//  2020.07.31_2nd_Project
//
//  Created by Dustin on 2020/07/30.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
    var networkModel = CallRequest()

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextView()
        configureUI()
        configureNavBar()
    }
    

    
    func configureUI() {
        tabBarController?.tabBar.isHidden = true
    
        
    }
    
    func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "글쓰기", style: .plain, target: self, action: #selector(handleWriteDone))
        
    }
    
    
    func configureTextView() {
        
        
        
    }

    @objc func handleWriteDone() {
        
        let param : [String : Any ] = [
            "testuser" : 2,
            "content" : textView.text ?? "",
            "like" : true
        ]
        
        networkModel.post(method: .post, param: param,url:networkModel.url) { json in
            print("success")
            
            
            
        }
        
        
        navigationController?.popViewController(animated: true)
        
        
    }
}
