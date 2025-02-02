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
    let myListNames = ["미리 알림"]
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
                Section
                {
                    NavigationLink
                    {
                        TodayView()
                    }
                    label:
                    {
                        Text("오늘")
                    }
                }
                
                Section
                {
                    NavigationLink
                    {
                        ScheduleView(items: items)
                    }
                    label:
                    {
                        Text("예정 \(items.count)")
                    }
                }
                
                Section
                {
                    NavigationLink
                    {
                        AllScheduleView(items: items)
                    }
                    label:
                    {
                        Text("전체 \(items.count)")
                    }
                }
                
                Section
                {
                    NavigationLink
                    {
                        EndScheduleView()
                    }
                    label:
                    {
                        let isEndCountValue = items.filter  //GPT 활용
                        {
                            $0.isEnd == true
                        }
                        .count
                        
                        Text("완료됨 \(isEndCountValue)")
                    }
                }
                
                Section
                {
//                    ForEach(items)
//                    { item in
//                        NavigationLink
//                        {
//                            Text("\(item.title) / \(item.content)")
//                        }
//                        label:
//                        {
//                            Text("\(item.title) / \(item.content)")
//                        }
//                    }
                    
//                    LazyVGrid(columns: gridCell, spacing: 10)
//                    {
//                        ForEach(0...1, id: \.self)
//                        { num in
////                            VStack
////                            {
////                                HStack
////                                {
//                                    NavigationLink
//                                    {
////                                        TodayView(item: item)
//                                        
//                                        if(num == 1)
//                                        {
//                                            TodayView()
//                                        }
//                                        else
//                                        {
//                                            AllScheduleView()
//                                        }
//                                        
//                                    }
//                                    label:
//                                    {
//                                        VStack{
////                                            HStack{
//                                                Image(systemName: listIcons[0])
//                                                    .padding(10)
//                                                Text("0")
//                                                    .padding(10)
////                                            }
//                                        }
//                                    }
////                                }
////                                Text("제목")
////                            }
//                        }
//                        .frame(
//                            minWidth: 100,
//                            maxWidth: .infinity,
//                            minHeight: 100,
//                            maxHeight: .infinity
//                        )
//                        .background(.white)
//                        .cornerRadius(8)
//                    }
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
                    
                    ForEach(myListNames, id: \.self)
                    { myListNames in
                        NavigationLink
                        {
                            Text("미리 알림 in")
                        }
                        label:
                        {
                            Image(systemName: "list.bullet.circle.fill")
                            Text("미리 알림")
                        }
                    }
                    .onDelete(perform: deleteItems)
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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }

}

//private func addItem() {
    //    withAnimation {
    //        let newItem = Item(timestamp: Date())
    //        modelContext.insert(newItem)
    //    }
//}



//#Preview
//{
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
