//
//  DetailsVC.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var TaskTitleTextfield: UITextField!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    private let manager = TaskManager()
    var selectedTask: Task? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        self.title = "Details"
        self.TaskTitleTextfield.text = selectedTask?.title
        self.completedSwitch.isOn = (selectedTask?.completed == true)
    }
    

    @IBAction func saveBtnTapped(_ sender: UIButton) {
        if(TaskTitleTextfield.text?.isEmpty == false){
            let task = Task(id: selectedTask!.id, title: TaskTitleTextfield.text!, completed: completedSwitch.isOn)
            if (manager.updateTask(task: task)) {
                navigationController?.popViewController(animated: true)
                displayAlert( alertMessage: "Task Updated")
            } else {
                displayErrorAlert()
            }
        }
        
    }
    
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
        
        if(manager.deleteTask(id: selectedTask!.id)) {
            navigationController?.popViewController(animated: true)
            displayAlert(alertMessage: "Task deleted")
        } else {
            
        }
        
        
    }
    
    func displayAlert(alertMessage: String) {
        let alertController = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
        
       
       }
    
    func displayErrorAlert() {
        displayAlert(alertMessage: "An error ocurred")
       }



}
