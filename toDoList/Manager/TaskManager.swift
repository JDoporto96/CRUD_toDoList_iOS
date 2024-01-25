//
//  TaskManager.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//

import Foundation

struct TaskManager {
    private let _taskDataRepository = TaskDataRepository()
    
    func createTask(task: Task) {
        _taskDataRepository.create(task: task)
    }
    
    func fetchAllTasks() -> [Task]? {
        return _taskDataRepository.getAll()
    }
    
    func fetchTask(byIdentifier id: UUID) -> Task? {
        return _taskDataRepository.get(byIdentifier: id)
    }
    
    func updateTask(task: Task) -> Bool {
        return _taskDataRepository.update(task: task)
    }
    
    func deleteTask(id: UUID) -> Bool {
        return _taskDataRepository.delete(id: id)
    }
    
}
