//
//  CallRequest.swift
//  2020.07.31_2nd_Project
//
//  Created by Dustin on 2020/07/31.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//네트워크 통신

class CallRequest {
    
     let url = "http://192.168.0.2:32769/posts/"
    //1.클로저 = success 함수이름 , json -> 반환값 없음.
    //3.클로저 @escaping 나 탈출한다~
    //4.JSON -> 타입을 정해준다.
    func post(method : HTTPMethod, param: [String : Any]? = nil, success : @escaping(JSON) -> ()) {
                //1.Post Parameter
        
        
               AF.request(url, method: method, parameters: param).validate().responseJSON { response in
               switch response.result {
     
               case .success(let value):
                   let json = JSON(value)
                   //2.클로저 = 함수자체를 매개변수로 해주겠다.
                   
                   success(json)
                
                print(json)
                   case .failure(let error):
                        
                       print(error)
                   }
                       
               }

        
        
    }
    
    
    
}
