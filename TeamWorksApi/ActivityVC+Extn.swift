//
//  ActivityVC+Extn.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/15/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Foundation

//Handle Every Tab Part: Recent Activity, 1- All Projects, 2- "\(var)" project tasks, All Tasks
extension ActivityVC {
    
    func searchingStarted(text: String){
        switch selectedColletionVIndexPath.item {
        case 0:
            recentactivitys = RecentActivityServices.instance.recentActivity!.activity.filter({ $0.description.lowercased().contains(text)})
            
        case 1:
            allprojects = ProjectsServices.instance.projects.projects.filter({$0.name.lowercased().contains(text)})
            
        case 2:
            alltasks = AllTasksServices.instance.allTasks.todoItems.filter({$0.projectName.lowercased().contains(text)})
            
        default:
            break
        }
        self.tableView.reloadData()
    }
    
    
    func fetchRecentActivities(){
        RecentActivityServices.instance.fetchActivityServices { (success) in
            if success {
                self.tableView.reloadData()
            }
            self.activityV.isHidden = true
        }
    }
    
    func fetchAllProjects(){
        ProjectsServices.instance.fetchProjects{ (success) in
            if success {
                self.tableView.reloadData()
            }
            self.activityV.isHidden = true
        }
    }
    
    func fetchAllTasks() {
        AllTasksServices.instance.fetchAllTasks { (success) in
            if success {
                self.tableView.reloadData()
            }
            self.activityV.isHidden = true
        }
    }
    
    
    
    func theNecessaryCell(cell: TableVCell, row: Int) -> TableVCell {
        switch selectedColletionVIndexPath.item {
        case 0:
            if inSearchingMode {
                cell.taskTitleTF.stringValue = recentactivitys[row].description ?? ""
            } else {
                cell.taskTitleTF.stringValue = RecentActivityServices.instance.recentActivity?.activity[row].description ?? ""
            }
            return cell
        case 1:
            if inSearchingMode {
                cell.taskTitleTF.stringValue = allprojects[row].name ?? ""
            } else {
                cell.taskTitleTF.stringValue = ProjectsServices.instance.projects?.projects[row].name ?? ""
            }
            return cell
        case 2:
            if inSearchingMode {
                let title = "Project Name:  \(alltasks[row].projectName ?? String())"
                let title2 = "To-Do List Name:  \(alltasks[row].todoListName ?? String())"
                cell.taskTitleTF.stringValue = title + "\n" + title2
            } else {
                let title = "Project Name:  \(AllTasksServices.instance.allTasks?.todoItems[row].projectName ?? String())"
                let title2 = "To-Do List Name:  \(AllTasksServices.instance.allTasks?.todoItems[row].todoListName ?? String())"
                cell.taskTitleTF.stringValue =  title + "\n" + title2
            }
            return cell
        default:
            return cell
        }
    }
    
    func numberOfRows() -> Int {
        switch selectedColletionVIndexPath.item {
        case 0:
            if inSearchingMode {
                return recentactivitys.count
            } else {
                return RecentActivityServices.instance.recentActivity?.activity.count ?? 0
            }
            
        case 1:
            if inSearchingMode {
                return allprojects.count
            } else {
                return ProjectsServices.instance.projects.projects.count ?? 0
            }
        case 2:
            if inSearchingMode {
                return alltasks.count
            } else {
                return AllTasksServices.instance.allTasks.todoItems.count ?? 0
            }
        default:
            return 0
        }
    }
    
    
    
}
