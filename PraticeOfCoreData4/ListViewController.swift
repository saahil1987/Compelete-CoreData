//
//  ListViewController.swift
//  PraticeOfCoreData4
//
//  Created by Saahil Kaushal on 09/10/23.
//

import UIKit
protocol DataPass{
    func data(object:[String:String])
}

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var college = [University]()
    
    
    @IBOutlet weak var myTable: UITableView!
    
    var delegate:DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        
        college = DatabaseHelper.university.fetchData()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return college.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        cell.davLbl.text = college[indexPath.row].davCollege
        cell.hmvLbl.text = college[indexPath.row].hmvCollege
        cell.khalsaLbl.text = college[indexPath.row].khalsaCollege
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    // func for Delete Data from Core Data
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            college = DatabaseHelper.university.deleteData(index: indexPath.row)
            self.myTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    //Func is used for UpDate/Edit Data in CoreData
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["davCollege":college[indexPath.row].davCollege,"hmvCollege":college[indexPath.row].hmvCollege,"khalsaCollege":college[indexPath.row].khalsaCollege]
           delegate.data(object: dict as! [String:String])
           self.navigationController?.popViewController(animated: true)
    }

}
