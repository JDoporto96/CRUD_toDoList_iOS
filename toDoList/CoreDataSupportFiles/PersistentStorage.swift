//
//  PersistentStorage.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//

import Foundation
import CoreData

final class PersistentStorage {
    
    private init(){}
    static let shared = PersistentStorage()
    
    //MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
            let container = NSPersistentContainer(name: "CDTask")
            container.loadPersistentStores { (_, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            }
            return container
        }()

    lazy var context = persistentContainer.viewContext
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(manageObject: T.Type) -> [T]? {
        do {
            guard let result = try
                    PersistentStorage.shared.context.fetch(manageObject.fetchRequest()) as? [T] else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
}
