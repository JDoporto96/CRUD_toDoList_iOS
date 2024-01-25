//
//  AddTaskVC.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var NewTaskTitleTextfield: UITextField!
    private let manager: TaskManager = TaskManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        self.title = "Add new task"
    }
    

    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        if(!NewTaskTitleTextfield.text!.isEmpty) {
            let task = Task(id: UUID(), title: NewTaskTitleTextfield.text!, completed: false)
            
            manager.createTask(task: task)
            
            navigationController?.popViewController(animated: true)
        }
    }
    

}
