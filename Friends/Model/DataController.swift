//
//  DataController.swift
//  Friends
//
//  Created by Joshan Rai on 4/6/22.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Friends")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        }
    }
}
