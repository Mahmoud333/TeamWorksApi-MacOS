//
//  ActivityVC.swift
//  TeamWorksApi
//
//  Created by Mahmoud Hamad on 2/13/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Cocoa

class ActivityVC: NSViewController, NSSearchFieldDelegate {

    //Progress
    @IBOutlet weak var activityV: MAProgressV!
    
    //Sidebar
    @IBOutlet weak var containerView: NSView!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    //TableView
    @IBOutlet weak var searchBar: NSSearchField!
    @IBOutlet weak var tableView: NSTableView!
    
    
    let tabsTitles = ["Recent Activity", "All Projects", "All Tasks"]
    var selectedColletionVIndexPath = IndexPath(item: 0, section: 0) //by default its the first cell
    
    //Our Data
    var recentactivitys = [Activity]()
    var allprojects = [Project]()
    var alltasks = [TodoItem]()
    
    //switches
    var inSearchingMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self; collectionView.dataSource = self
        tableView.delegate = self; tableView.dataSource = self
        tableView.target = self
        tableView.action = #selector(tableViewClicked)
        searchBar.delegate = self
        
        //in tableViewClicked we will do it manually
        tableView.selectionHighlightStyle = .none
                
        
        collectionView.register(SideBarCell.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SideBarCell"))
        //tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableVCell"), owner: nil)
        
        
        
        
        fetchRecentActivities()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        containerView.wantsLayer = true
        containerView.layer?.backgroundColor = mainColor.cgColor
        

        

    }
    

    
    //Search
    override func controlTextDidChange(_ obj: Notification) {
        let searchTF = obj.object as! NSSearchField
        print("\(searchTF.stringValue)")
        
        if searchTF.stringValue != nil || searchTF.stringValue != " " {
            print("inside if")
            inSearchingMode = true
            searchingStarted(text: searchTF.stringValue.lowercased())
        }
        if searchTF.stringValue == ""{
            print("inside else")

            inSearchingMode = false
            tableView.reloadData()
        }
    }
}

extension ActivityVC: NSTableViewDelegate, NSTableViewDataSource {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TableVCell"), owner: nil) as? TableVCell {
            print("viewFor tableColumn \(row)")
            
            cell.taskImageV.image = NSImage(named: NSImage.Name(rawValue: "dark1"))
            
            theNecessaryCell(cell: cell, row: row)
            //cell.taskTitleTF.stringValue = RecentActivityServices.instance.recentActivity?.activity[row].description ?? ""
            //"askjbfja sfbashf sahbfhas"

            return cell
        }
        return nil
    }
    
    @objc func tableViewClicked(_ sender: Any) {
        print("selectedRow: \(tableView.selectedRow)") //print("clickedRow: \(tableView.clickedRow)")
        
        let cell = tableView.view(atColumn: 0, row: tableView.clickedRow, makeIfNecessary: true) as! TableVCell
        cell.layer?.backgroundColor = NSColor.lightGray.cgColor
        cell.taskTitleTF.textColor = NSColor.white
        

        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.15) {
            cell.layer?.backgroundColor = NSColor.white.cgColor
            cell.taskTitleTF.textColor = NSColor.black
        }

    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return numberOfRows()
    }
}

extension ActivityVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let sideBarItem  = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SideBarCell"), for: indexPath)
        guard let sideBarCell = sideBarItem as? SideBarCell else { return sideBarItem  }
        
        sideBarCell.tabtf.stringValue = tabsTitles[indexPath.item]  //"Activity"
        
        
        
        if indexPath.item == 0 {
            sideBarCell.selectIT()
        }
        return sideBarCell
    }
    
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print("didSelectItemsAt")
        // Make sure 1st cell not selected
        let firstcell = collectionView.item(at: IndexPath(item: 0, section: 0)) as! SideBarCell
        firstcell.unselectIT()
        
        //display our progress indicator
        activityV.isHidden = false
        //fetch Necessary data
        switch indexPaths.first!.item {
        case 0: fetchRecentActivities()
        case 1: fetchAllProjects()
        case 2: fetchAllTasks()
        default:
            break;
        }
        
        //Do our work Now
        selectedColletionVIndexPath = indexPaths.first!
        let cell = collectionView.item(at: indexPaths.first!) as! SideBarCell
        cell.selectIT()

    }
    
    func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
        let cell = collectionView.item(at: indexPaths.first!) as! SideBarCell
        //cell.view.layer?.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        cell.view.layer?.borderColor = NSColor.black.cgColor

    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabsTitles.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 100, height: 50)
    }
    
}





















