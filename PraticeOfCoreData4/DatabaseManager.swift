//
//  DatabaseManager.swift
//  PraticeOfCoreData4
//
//  Created by Saahil Kaushal on 09/10/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    static var university = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    func saveData(object:[String:String]){
        let university = NSEntityDescription.insertNewObject(forEntityName: "University", into: context!) as? University
        university?.davCollege = object["davCollege"]
        university?.hmvCollege = object["hmvCollege"]
        university?.khalsaCollege = object["khalsaCollege"]
        do{
            try context?.save()
        }catch{
            print("Data not Save")
        }
    }
    func fetchData() -> [University]{
        var college = [University]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "University")
        do{
            college = try context?.fetch(fetchRequest) as! [University]
        }catch{
            print("cannot fetch data")
        }
        return college
    }
    // Func is Used For Delete Core Data
    func deleteData(index:Int) -> [University]{
        
        var college = fetchData()
        context?.delete(college[index])
        college.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("data cannot delete")
            
        }
        return college
    }
}
