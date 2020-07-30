//
//  BoardViewController.swift
//  2020.07.31_2nd_Project
//
//  Created by Dustin on 2020/07/30.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Floaty

class BoardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       configureFloatBtn()
        configureTableView()
        
    }
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func configureFloatBtn() {
        
        let floaty = Floaty()
        floaty.paddingY = 60
        
        floaty.addItem("글쓰기", icon:UIImage(systemName: "pencil"), titlePosition: .left) { item in
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "WriteViewController") as! WriteViewController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            floaty.close()
        }
     
        self.view.addSubview(floaty)
    }
    



}


extension BoardViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardTableViewCell", for: indexPath) as! BoardTableViewCell
        
        return cell
    }
    
    
    
    
}
