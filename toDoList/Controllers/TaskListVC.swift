//
//  ViewController.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//

import UIKit

class TaskListVC: UIViewController {
    
    
    @IBOutlet weak var TaskListTableView: UITableView!
    private let manager = TaskManager()
    var tasks: [Task]? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Task List"
        
        let nib = UINib(nibName: "TaskListCell", bundle: nil)
        TaskListTableView.register(nib, forCellReuseIdentifier: "TaskListCell")
        TaskListTableView.delegate = self
        TaskListTableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasks = manager.fetchAllTasks()
        if(tasks != nil && tasks?.count != 0) {
            self.TaskListTableView.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == SegueIdentifiers.navigationToDetails.rawValue) {
            let detailsView = segue.destination as? DetailsVC
            guard detailsView != nil else { return }
            detailsView?.selectedTask = self.tasks![self.TaskListTableView.indexPathForSelectedRow!.row]
        }
    }

    @IBAction func AddBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "AddTaskSegue", sender: self)
    }
   

}


