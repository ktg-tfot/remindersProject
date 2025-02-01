//
//  ContentView.swift
//  remindersProject
//
//  Created by 김태건 on 1/22/25.
//

import SwiftUI
import SwiftData

struct ContentView: View
{
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var editMode: EditMode = .inactive
    @State private var searchText = ""
    
    @State private var showAddReminder: Bool = false
    
    let gridCell = [GridItem(.flexible()),GridItem(.flexible())]
    let listNames = ["오늘", "예정", "전체", "완료됨"]
    let listIcons = ["calendar.circle.fill",
                     "calendar.circle.fill",
                     "tray.circle.fill",
                     "checkmark.circle.fill"]
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
                Section()
                {
                    LazyVGrid(columns: gridCell, spacing: 10)
                    {
                        ForEach(listNames, id: \.self)
                        { listNames in
                            VStack
                            {
                                HStack
                                {
                                    Image(systemName: listIcons[0])
                                        .padding(10)
                                    Text("0")
                                        .padding(10)
                                }
                                
                                Text(listNames)
                            }
                        }
                        .frame(
                            minWidth: 100,
                            maxWidth: .infinity,
                            minHeight: 100,
                            maxHeight: .infinity
                        )
                        .background(.white)
                        .cornerRadius(8)
                    }
                }
                .listRowInsets(EdgeInsets())  //GPT 참고
                .listRowBackground(Color.clear)  //GPT 참고
                .padding(.top, 20)
                
                Section(header: Text("나의 목록")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding([.leading, .bottom], 10.0))
                {
                    HStack
                    {
                        Image(systemName: "list.bullet.circle.fill")
                        Text("미리 알림")
                    }
                    .padding()
                    
                }
                .listRowInsets(EdgeInsets())
                
                
            }
            .searchable(text: $searchText, prompt: "검색")
            .environment(\.editMode, $editMode)
            .navigationBarItems(trailing: editButton)
            .toolbar
            {
                ToolbarItem(placement: .bottomBar)  //GPT 참고
                {
                    HStack{
                        Button
                        {
                            print("[D]새로운미리알림 버튼")
                            showAddReminder = true
                        }
                        label:
                        {
                            Image(systemName: "plus.circle.fill")
                            Text("새로운 미리 알림")
                        }
                        
                        Spacer()
                        
                        Button
                        {
                            print("[D]목록추가 버튼")
                        }
                        label:
                        {
                            Text("목록 추가")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showAddReminder)
        {
            AddReminderView() 
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

//private func addItem() {
    //    withAnimation {
    //        let newItem = Item(timestamp: Date())
    //        modelContext.insert(newItem)
    //    }
//}

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

#Preview
{
    ContentView()
    //        .modelContainer(for: Item.self, inMemory: true)
}
