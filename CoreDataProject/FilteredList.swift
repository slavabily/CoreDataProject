//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by slava bily on 17/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    var subjects: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    enum Predicate: String {
        case didBeginsWith = "%K BEGINSWITH %@"
    }
    
    init(format: Predicate, filterKey: String, filterValue: String, sortDescriptors: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        
        fetchRequest =
            FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: format.rawValue, filterKey, filterValue))
        self.content = content
    }
    
    var body: some View {
        List(subjects, id: \.self) { singer in
            self.content(singer)
        }
    }
}

 
