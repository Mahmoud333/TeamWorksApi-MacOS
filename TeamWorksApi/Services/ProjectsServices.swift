//
//  ProjectServices.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/8/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ProjectsServices {
    
    static var instance = ProjectsServices()
    
    //var projects:
    //var _projects
    var projects: File! {
        get {
            return _projects
        }
    }
    private var _projects: File?

    
    func fetchProjects(completion: @escaping(Bool)->()) {
        
        let url = "https://mahmoudsmglllllllll.teamwork.com/projects.json"
        
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
                        self._projects = try JSONDecoder().decode(File.self, from: data!)
                        print("projects: \(self.projects.projects)")
                        print("projects count: \(self.projects.projects.count)")
                        completion(true)

                    } catch {"error with JSON: \(print(error.localizedDescription))"}
                    
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
                    return                }
                
        }
    }
    
}
