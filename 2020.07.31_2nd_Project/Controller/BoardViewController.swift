//
//  BoardViewController.swift
//  2020.07.31_2nd_Project
//
//  Created by Dustin on 2020/07/30.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Floaty
import Alamofire
import SwiftyJSON

class BoardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    

    
    var networkModel = CallRequest()
    
    var boardModel : [BoardModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = UITableView.automaticDimension

        
       configureFloatBtn()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchPost()
        
        
    }
    
    func fetchPost() {
        boardModel.removeAll()
        
        
        networkModel.post(method: .get,url:networkModel.url) { json in
                        for item in json.array! {
                      
                            
        var data = BoardModel(id: item["id"].intValue, content: item["content"].stringValue, uid: item["testuser"]["uid"].stringValue, like: item["like"].boolValue, regdate: item["created_at"].stringValue)
                            
                            
                            //class로 만들었을떄,
        //                  var data = BoardModel()
        //                data.id = item["id"].intValue
        //                data.content  = item["content"].stringValue
        //                data.uid = item["testuser"]["uid"].stringValue
                        self.boardModel.append(data)
                    
                           
                    
                        }
                    
                     self.tableView.reloadData()
                }
        
        
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
        
        floaty.addItem(title: "업로드") { item in
            print(123)
        }
     
        self.view.addSubview(floaty)
    }
    



}


extension BoardViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardTableViewCell", for: indexPath) as! BoardTableViewCell
        
        let item = boardModel[indexPath.row]
        
        cell.contentsLabel.text = item.content
        cell.contentsLabel.numberOfLines = 0
        cell.nicknameLabel.text = item.uid
        cell.dateLabel.text = item.regdate
        if item.like {
            cell.likedBtn.tintColor = .red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        
//        let sb = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "WriteViewController") as! WriteViewController
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .coverVertical
//
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
           let deleteAction = UIContextualAction(style: .destructive, title:  "삭제", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
    
               success(true)
            self.networkModel.post(method: .delete, url: self.networkModel.url+"/\(self.boardModel[indexPath.row].id)") { json in
                self.fetchPost()
            }

           })

           let shareAction = UIContextualAction(style: .normal, title:  "수정", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in

               success(true)

           })

           return UISwipeActionsConfiguration(actions:[shareAction,deleteAction])

       }
    
    
    
    
    
    
}
