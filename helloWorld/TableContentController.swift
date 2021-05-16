//
//  TableViewController.swift
//  helloWorld
//
//  Created by Venkatesh Rajendran on 16/05/21.
//
import UIKit

class TableContentController: UIViewController{
    
    
    @IBOutlet var tableView : UILabel!
    
    var item : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView?.text = (item)!
    }

   
    

}
