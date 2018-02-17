//
//  File2.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/9/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

// Generated with quicktype
// For more options, try https://app.quicktype.io

import Foundation

//Tasklist
//In Tasks Services
struct File2: Codable {
    let status: String
    let tasklists: [Tasklist]

    enum CodingKeys: String, CodingKey {
        case status = "STATUS"
        case tasklists
    }
}

struct Tasklist: Codable {
    let name: String
    let pinned: Bool
    let milestoneID, description: String
    let uncompletedCount: Int
    let id: String
    let complete, purplePrivate, isTemplate: Bool
    let position: Int
    let status, projectID, projectName: String
    let dlm: JSONNull?

    enum CodingKeys: String, CodingKey {
        case name, pinned
        case milestoneID = "milestone-id"
        case description
        case uncompletedCount = "uncompleted-count"
        case id, complete
        case purplePrivate = "private"
        case isTemplate, position, status
        case projectID = "projectId"
        case projectName
        case dlm = "DLM"
    }
}

// MARK: Convenience initializers

extension File2 {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(File2.self, from: data) else { return nil }
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

extension Tasklist {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Tasklist.self, from: data) else { return nil }
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



