//
//  File4.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/13/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Foundation


struct File4: Codable {
    let status: String
    let todoItems: [TodoItem]

    enum CodingKeys: String, CodingKey {
        case status = "STATUS"
        case todoItems = "todo-items"
    }
}
//All Tasks
//TodoItem
struct TodoItem: Codable {
    let id: Int
    let canComplete: Bool
    let commentsCount: Int
    let description: String
    let hasReminders, hasUnreadComments: Bool
    let purplePrivate: Int
    let content: String
    let order, projectID: Int
    let projectName: String
    let todoListID: Int
    let todoListName: String
    let tasklistPrivate, tasklistIsTemplate: Bool
    let status, companyName: String
    let companyID, creatorID: Int
    let creatorFirstname, creatorLastname: String
    let completed: Bool
    let startDate, dueDateBase, dueDate, createdOn: String
    let lastChangedOn: String
    let position, estimatedMinutes: Int
    let priority: String
    let progress: Int
    let harvestEnabled: Bool
    let parentTaskID, lockdownID, tasklistLockdownID: String
    let hasDependencies, hasPredecessors: Int
    let hasTickets: Bool
    let timeIsLogged: String
    let attachmentsCount: Int
    let predecessors: [JSONAny]
    let canEdit, viewEstimatedTime: Bool
    let creatorAvatarURL: String
    let canLogTime, userFollowingComments, userFollowingChanges: Bool
    let dlm: Int

    enum CodingKeys: String, CodingKey {
        case id, canComplete
        case commentsCount = "comments-count"
        case description
        case hasReminders = "has-reminders"
        case hasUnreadComments = "has-unread-comments"
        case purplePrivate = "private"
        case content, order
        case projectID = "project-id"
        case projectName = "project-name"
        case todoListID = "todo-list-id"
        case todoListName = "todo-list-name"
        case tasklistPrivate = "tasklist-private"
        case tasklistIsTemplate = "tasklist-isTemplate"
        case status
        case companyName = "company-name"
        case companyID = "company-id"
        case creatorID = "creator-id"
        case creatorFirstname = "creator-firstname"
        case creatorLastname = "creator-lastname"
        case completed
        case startDate = "start-date"
        case dueDateBase = "due-date-base"
        case dueDate = "due-date"
        case createdOn = "created-on"
        case lastChangedOn = "last-changed-on"
        case position
        case estimatedMinutes = "estimated-minutes"
        case priority, progress
        case harvestEnabled = "harvest-enabled"
        case parentTaskID = "parentTaskId"
        case lockdownID = "lockdownId"
        case tasklistLockdownID = "tasklist-lockdownId"
        case hasDependencies = "has-dependencies"
        case hasPredecessors = "has-predecessors"
        case hasTickets, timeIsLogged
        case attachmentsCount = "attachments-count"
        case predecessors, canEdit, viewEstimatedTime
        case creatorAvatarURL = "creator-avatar-url"
        case canLogTime, userFollowingComments, userFollowingChanges
        case dlm = "DLM"
    }
}

// MARK: Convenience initializers

extension File4 {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(File4.self, from: data) else { return nil }
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

extension TodoItem {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(TodoItem.self, from: data) else { return nil }
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

// MARK: Encode/decode helpers

