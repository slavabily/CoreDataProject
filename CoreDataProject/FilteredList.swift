//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by slava bily on 17/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct FilteredList: View {
    
    var fetchRequest: FetchRequest<Singer>
    
    init(filter: String) {
        fetchRequest =
            FetchRequest(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}

 
