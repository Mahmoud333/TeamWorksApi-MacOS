//
//  TasksServices.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/9/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Alamofire

class TasksServices {
    
    static var instance = TasksServices()
    
    
    var tasks: File2! {
        get {
            return _tasks
        }
    }
    private var _tasks: File2?
    
    
    func fetchProjects(id: String,completion: @escaping(Bool)->()) {
        
        let url = "https://mahmoudsmglllllllll.teamwork.com/projects/\(id)/tasklists.json"
        print(url)

        Alamofire.request(url)
            .authenticate(user: TOKEN, password: "x")
            .responseData { response in 
                
                Swift.print(response.result)
                switch response.result {
                case .success:
                    //print(response.value)
                    
                    
                    //way 1
                    let data = response.result.value
                    do {
                        self._tasks = try JSONDecoder().decode(File2.self, from: data!)
                        print("projects: \(self.tasks.tasklists)")
                        print("projects count: \(self.tasks.tasklists.count)")
                        completion(true)
                        
                    } catch { debugPrint("error with JSON: \(print(error.localizedDescription))") }
                    
                    //way 2
                    //let responseObject = response.result.value as! [String: Any]
                    //let projects = responseObject["projects"] as! [[String : Any]
                    /*let projectsArray = projects.flatMap({ (projects) -> ProjectS? in
                     return try? ProjectS.decode(j: projects)
                     })*/
                    //print("1: \(projectsArray)")
                    //print("2: \(projectsArray.first?.companyId)")
                    //print("3: \(projectsArray.first?.name)")
                    
                    
                    //way 3
                    /*
                     //let json = JSON(response.value)
                     //let projects = json["projects"].arrayValue
                     
                     for i in 1..<projects.count {
                     
                     let project = Project()
                     project.createdOn         = projects[i]["created-on"].stringValue
                     project.description       = projects[i]["description"].stringValue
                     project.endDate           = projects[i]["endDate"].stringValue
                     project.id                = projects[i]["id"].stringValue
                     project.lastChangedOn     = projects[i]["last-changed-on"].stringValue
                     project.name              = projects[i]["name"].stringValue
                     project.privacyEnabled    = projects[i]["privacyEnabled"].boolValue
                     project.status            = projects[i]["status"].stringValue
                     
                     project.companyId         = projects[i]["company"]["id"].stringValue
                     project.companyIsOwner    = projects[i]["company"]["is-owner"].stringValue
                     project.companyName       = projects[i]["company"]["name"].stringValue
                     }
                     */
                    
                case .failure(let error):
                    debugPrint("Case error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
        }
    }
    
    
    
}
