//
//  TaskDataRepository.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//

import Foundation
import CoreData

protocol TaskRepository {
    
    func create(task: Task)
    func getAll() -> [Task]?
    func get(byIdentifier id: UUID) -> Task?
    func update(task: Task) -> Bool
    func delete(id: UUID) -> Bool
}



struct TaskDataRepository : TaskRepository {
    
    func create(task: Task) {
        let cdTask = CDTask(context: PersistentStorage.shared.context)
        cdTask.id = task.id
        cdTask.completed = task.completed
        cdTask.title = task.title
        
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Task]? {
        let result = PersistentStorage.shared.fetchManagedObject(manageObject: CDTask.self)
        
        var tasks : [Task] = []
        
        result?.forEach({ (cdTask) in
            tasks.append(cdTask.convertToTask())
        })
        
        return tasks
    }
    
    func get(byIdentifier id: UUID) -> Task? {
        let result = getCDTask(byIdentifier: id)
        guard result != nil else { return nil }
        return result?.convertToTask()
    }
    
    func update(task: Task) -> Bool {
        let cdTask = getCDTask(byIdentifier: task.id)
        guard cdTask != nil else { return false}
        
        print("Task found")
        cdTask?.title = task.title
        cdTask?.completed = task.completed
        
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let cdTask = getCDTask(byIdentifier: id)
        guard cdTask != nil else { return false}
        
        PersistentStorage.shared.context.delete(cdTask!)
        PersistentStorage.shared.saveContext()
        return true
        
    }
    
    private func getCDTask(byIdentifier id: UUID) -> CDTask? {
        let fetchRequest = NSFetchRequest<CDTask>(entityName: "CDTask")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        do {
            let result = try
            PersistentStorage.shared.context.fetch(fetchRequest).first
            
            guard result != nil else { return nil}
            
            return result
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
    
}
