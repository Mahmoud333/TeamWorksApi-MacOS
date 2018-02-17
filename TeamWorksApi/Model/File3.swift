//
//  File3.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/11/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Foundation

//In Acivities services
struct File3: Codable {
    let activity: [Activity]
    let status: String

    enum CodingKeys: String, CodingKey {
        case activity
        case status = "STATUS"
    }
}

//Activity
struct Activity: Codable {
    
    /*let projectID: ProjectID
    let itemid, fromUserAvatarURL, description: String
    let forusername: DueDate
    let publicinfo: Publicinfo
    let foruserid: DueDate
    let itemlink: Itemlink
    let datetime: String
    let activitytype: Ype
    let companyID: CompanyID
    let projectName: ProjectName
    let latestActivityType: Ype
    let link: String
    let extradescription: Extradescription
    let isprivate: Isprivate
    let companyName: CompanyName
    let id: String
    let dueDate, lockdownID: DueDate
    let fromusername: Fromusername
    let type: PurpleType
    let forUserAvatarURL: DueDate
    let userid: Userid*/
    let projectID: String
    let itemid, fromUserAvatarURL, description: String
    let forusername: String
    let publicinfo: String
    let foruserid: String
    let itemlink: String
    let datetime: String
    let activitytype: String
    let companyID: String
    let projectName: String
    let latestActivityType: String
    let link: String
    let extradescription: String
    let isprivate: String
    let companyName: String
    let id: String
    let dueDate, lockdownID: String
    let fromusername: String
    let type: String
    let forUserAvatarURL: String
    let userid: String
    
    enum CodingKeys: String, CodingKey {
        case projectID = "project-id"
        case itemid
        case fromUserAvatarURL = "from-user-avatar-url"
        case description, forusername, publicinfo, foruserid, itemlink, datetime, activitytype
        case companyID = "company-id"
        case projectName = "project-name"
        case latestActivityType, link, extradescription, isprivate
        case companyName = "company-name"
        case id
        case dueDate = "due-date"
        case lockdownID = "lockdownId"
        case fromusername, type
        case forUserAvatarURL = "for-user-avatar-url"
        case userid
    }
}
/*
enum Ype: String, Codable {
    case new = "new"
}

enum CompanyID: String, Codable {
    case the94749 = "94749"
}

enum CompanyName: String, Codable {
    case epic = "Epic"
}

enum DueDate: String, Codable {
    case empty = ""
}

enum Extradescription: String, Codable {
    case empty = ""
    case inbox = "Inbox"
}

enum Fromusername: String, Codable {
    case mahmoudA = "Mahmoud A."
}

enum Isprivate: String, Codable {
    case the0 = "0"
}

enum Itemlink: String, Codable {
    case empty = ""
    case tasklists812431 = "tasklists/812431"
    case tasklists812433 = "tasklists/812433"
}

enum ProjectID: String, Codable {
    case the269678 = "269678"
    case the269680 = "269680"
}

enum ProjectName: String, Codable {
    case asdfasdfasdf = "asdfasdfasdf"
    case howHow = "how how"
}

enum Publicinfo: String, Codable {
    case empty = ""
    case task = "task"
}

enum PurpleType: String, Codable {
    case project = "project"
    case task = "task"
    case tasklist = "tasklist"
}

enum Userid: String, Codable {
    case the181694 = "181694"
}
*/
// MARK: Convenience initializers

extension File3 {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(File3.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Activity {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Activity.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

