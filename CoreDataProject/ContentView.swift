//
//  ContentView.swift
//  CoreDataProject
//
//  Created by slava bily on 15/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
  @Environment(\.managedObjectContext) var moc
  
    @State private var lastNameFilter = ""
    
    var body: some View {
        VStack {
            FilteredList(filter: lastNameFilter)
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
     }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
