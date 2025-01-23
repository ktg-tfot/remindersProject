//
//  ContentView.swift
//  remindersProject
//
//  Created by 김태건 on 1/22/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var editMode: EditMode = .inactive
    @State private var searchText = ""
    
    //오늘 예정 전체 완료
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in

                }
            }
            .environment(\.editMode, $editMode)
            .navigationBarItems(trailing: editButton)
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarTrailing) {
            //                    EditButton()
            //                }
            .searchable(text: $searchText, prompt: "검색")    //Check B
//            .navigationTitle("Reminders")
            
        }
        
    }
    
    //Check A
    private var editButton: some View {
        return Button {
            if editMode == .inactive {
                editMode = .active
            } else {
                editMode = .inactive
            }
        } label: {
            Text(editMode == .inactive ? "편집" : "완료")
        }
    }
}
    



private func addItem() {
    //            withAnimation {
    //                let newItem = Item(timestamp: Date())
    //                modelContext.insert(newItem)
    //            }
}

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

#Preview {
    ContentView()
    //        .modelContainer(for: Item.self, inMemory: true)
}
