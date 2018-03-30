//
//  RapidDocumentController.swift
//  ATC
//
//  Created by Orbysol on 3/24/18.
//  Copyright © 2018 vaco. All rights reserved.
//

import UIKit

 open class RapidDocumentController: UIViewController {

    var tableView : UITableView?
    var documentListArray : Array<String>?
    var cacheUrlArray : Array<URL>?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Documents"
        getDocumentsUrlList()
        getDocumentsNamesList()
        tableView = UITableView(frame:CGRect(x:0,y:64,width:self.view.frame.size.width
            ,height:self.view.frame.size.height-64))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    }
    
    func getDocumentsNamesList() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        let fileManager1 = FileManager.default
        do {
            let installed_files = try fileManager1.contentsOfDirectory(atPath: documentsPath)
            print("check\(installed_files)")
            documentListArray = installed_files
        }
        catch {
            print("error")
        }
        if let index = documentListArray?.index(of:".DS_Store") {
            documentListArray?.remove(at: index)
            cacheUrlArray?.remove(at: index)
        }
    }
    
    func getDocumentsUrlList() {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            print("prashi \(fileURLs)")
            cacheUrlArray = fileURLs
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
    }
}
extension RapidDocumentController : UITableViewDelegate,UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentListArray!.count
            //cacheUrlArray!.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        if (cacheUrlArray?[indexPath.row].pathExtension.contains("png"))! || (cacheUrlArray?[indexPath.row].pathExtension.contains("jpg"))! || (cacheUrlArray?[indexPath.row].pathExtension.contains("pdf"))!  {
                cell.textLabel?.text = documentListArray?[indexPath.row]
        }
        else{
        cell.textLabel?.text = " 📁 \(documentListArray?[indexPath.row] ?? "")"
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (cacheUrlArray?[indexPath.row].pathExtension.contains("png"))! || (cacheUrlArray?[indexPath.row].pathExtension.contains("jpg"))! || (cacheUrlArray?[indexPath.row].pathExtension.contains("pdf"))!  {
                let detailController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RapidDocumentDetailController") as! RapidDocumentDetailController
                detailController.selectedPathUrl = cacheUrlArray?[indexPath.row]
                detailController.titleStr = documentListArray?[indexPath.row]
                self.navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
