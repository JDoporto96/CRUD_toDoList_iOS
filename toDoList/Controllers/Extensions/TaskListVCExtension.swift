
import UIKit

extension TaskListVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
         return 1
     }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return self.tasks!.count
         
     }

     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers().cellId, for: indexPath) as! TaskListCell
        
        let task = self.tasks![indexPath.row]
        cell.TaskTitleLabel.text = task.title
        cell.TaskStatusLabel.text = task.completed ? "Completed" : "Pending"
        cell.TaskStatusLabel.textColor = task.completed ? UIColor(.green) : UIColor(.red)
        
         return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: SegueIdentifiers.navigationToDetails.rawValue, sender: indexPath)
//        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
}

