//
//  ViewController.swift
//  2020.07.31_2nd_Project
//
//  Created by Dustin on 2020/07/28.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var walkingCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlert()
    }
    
    @IBAction func handleImgBtn(_ sender: UIButton) {
        

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
               
        let pic = UIAlertAction(title: "사진 촬영", style: .default, handler: nil )
        let gallery =  UIAlertAction(title: "갤러리로 이동", style: .default, handler: nil )
        
        let cancel =  UIAlertAction(title: "취소", style: .cancel, handler: nil )
        
               

        alert.addAction(pic)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        present(alert, animated: true , completion: nil)
    }
    func showAlert() {

    }


}


