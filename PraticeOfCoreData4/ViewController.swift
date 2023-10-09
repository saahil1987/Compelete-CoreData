//
//  ViewController.swift
//  PraticeOfCoreData4
//
//  Created by Saahil Kaushal on 09/10/23.
//

import UIKit

class ViewController: UIViewController,DataPass {
   
    
    
    
    @IBOutlet weak var collegeText: UITextField!
    @IBOutlet weak var collegeText1: UITextField!
    @IBOutlet weak var collegeText2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveBtn(_ sender: UIButton) {
        let dict = ["davCollege":collegeText.text,"hmvCollege":collegeText1.text,"khalsaCollge":collegeText2.text]
             DatabaseHelper.university.saveData(object: dict as! [String:String])
    }
    
    @IBAction func showBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController")as! ListViewController
        vc.delegate = self // used For UpData Data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // Func is used for Update Data
    func data(object: [String : String]) {
        collegeText.text = object["davCollege"]
        collegeText1.text = object["hmvCollege"]
        collegeText2.text = object["khalsaCollege"]
        
    }
    
}

