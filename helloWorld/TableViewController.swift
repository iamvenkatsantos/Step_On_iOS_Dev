//
//  TableViewController.swift
//  helloWorld
//
//  Created by Venkatesh Rajendran on 16/05/21.
//
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellID = "tableCell"

    
    var movies : Array<String> = ["Avengers","IronMan","Cap","Thor","Hawkeye","Widow","GOG","Strange"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"tableIndexNav",sender:self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text=movies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObject = movies[sourceIndexPath.item]
        movies.remove(at: sourceIndexPath.item)
        movies.insert(moveObject, at:destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            movies.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func onTableEdit(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing;
        sender.title = (self.tableView.isEditing) ? "Done" : "Edit"
    }
    
    
    @IBOutlet var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue : UIStoryboardSegue,sender :Any?)
    {
        if let destination = segue.destination as? TableContentController
         {
            destination.item = movies[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    

   
    

}
