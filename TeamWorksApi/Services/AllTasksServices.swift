//
//  AllTasksServices.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/13/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Alamofire
import SwiftyJSON

class AllTasksServices {
    
    static var instance = AllTasksServices()
    
    typealias COMPLETION_ALLTASKS = (Bool) -> ()

    
    var allTasks: File4! {
        get {
            return _allTasks
        }
    }
    
    var _allTasks: File4?
    
    func fetchAllTasks(completion: @escaping COMPLETION_ALLTASKS){
        
        let url = "https://mahmoudsmglllllllll.teamwork.com/tasks.json"
        
        Alamofire.request(url)
            .authenticate(user: TOKEN, password: "x")
            .responseData { response in //.responseData
                
                Swift.print(response.result)
                
                switch response.result {
                case .success:
                    
                    //print(response.value)
                    //print(JSON(response.result.value))
                    
                    //way 1
                    let data = response.result.value
                    do {
                        self._allTasks = try JSONDecoder().decode(File4.self, from: data!)
                        print("projects: \(self._allTasks?.todoItems)")
                        print("projects count: \(self._allTasks?.todoItems.count)")
                        completion(true)
                        
                    } catch {"error with JSON: \(print(error.localizedDescription))"}
                    
                    
                case .failure(let error):
                    debugPrint("Case error: \(error.localizedDescription)")
                    completion(false)
                    return
                    
                }
        }
    }
}
