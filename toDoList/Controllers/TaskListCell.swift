//
//  TaskListCell.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//

import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var TaskTitleLabel: UILabel!
    @IBOutlet weak var TaskStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
