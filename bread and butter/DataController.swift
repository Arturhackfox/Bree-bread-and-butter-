//
//  DataController.swift
//  bread and butter
//
//  Created by Arthur Sh on 14.12.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendsData")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Failed to load stores \(error.localizedDescription)")
                
                }
            }
        
    }
}
