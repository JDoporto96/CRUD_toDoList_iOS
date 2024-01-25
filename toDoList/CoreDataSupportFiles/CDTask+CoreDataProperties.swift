//
//  CDTask+CoreDataProperties.swift
//  toDoList
//
//  Created by Intekglobal01 on 1/24/24.
//
//

import Foundation
import CoreData


extension CDTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTask> {
        return NSFetchRequest<CDTask>(entityName: "CDTask")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    
    
    func convertToTask() -> Task {
        return Task( id: self.id!, title: self.title ?? "", completed: self.completed)
    }
}

extension CDTask : Identifiable {

}
