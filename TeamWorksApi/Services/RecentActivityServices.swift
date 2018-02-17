//
//  RecentActivityServices.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/11/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Alamofire
import SwiftyJSON

class RecentActivityServices {
    
    static var instance = RecentActivityServices()
    
    typealias COMPLETION_ACTIVITY = (Bool) -> ()
    
    var recentActivity: File3? {
        get {
            return _recentActivity
        }
    }
    
    private var _recentActivity: File3?
    
    func fetchActivityServices(completion: @escaping COMPLETION_ACTIVITY) {
        
        
        let url = "https://mahmoudsmglllllllll.teamwork.com/latestActivity.json"
        
        Alamofire.request(url)
            .authenticate(user: TOKEN, password: "x")
            .responseData { response in //.responseData
                
                Swift.print(response.result)
                switch response.result {
                case .success:
                    
                    //print(response.value)
                    print(JSON(response.result.value))
                    
                    //way 1
                    let data = response.result.value
                    do {
                        self._recentActivity = try JSONDecoder().decode(File3.self, from: data!)
                        print("projects: \(self.recentActivity!.activity)")
                        print("projects count: \(self.recentActivity!.activity.count)")
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
