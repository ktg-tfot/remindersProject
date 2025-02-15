//
//  ContentView.swift
//  remindersProject
//
//  Created by 김태건 on 1/22/25.
//
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
    
    var body: some View {
        NavigationStack {
            List
            {
                NavigationLink(destination: TodayView())
                {
                    Button {
                        
                    } label: {
                        
                        VStack
                        {
                            HStack
                            {
                                Image(systemName: "calendar.circle.fill")
                                    .font(.system(size: 30))
                                Spacer()
                                
                                Text("0")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                            Text("오늘")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .background(Color(.white))
                        .cornerRadius(12)
                    }
                    .listRowBackground(Color(UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)))
                }
                
                
                LazyVGrid(columns: gridCell, spacing: 15)
                {
                    NavigationLink(destination: TodayView())
                    {
                        VStack
                        {
                            HStack
                            {
                                Image(systemName: "calendar.circle.fill")
                                    .font(.system(size: 30))
                                Spacer()
                                
                                Text("0")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                            Text("오늘")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .background(Color(.white))
                        .cornerRadius(12)
                    }
                    
                    
                    NavigationLink(destination: ScheduleView(items: items))
                    {
                        VStack
                        {
                            HStack
                            {
                                let scheduleCountValue = items.filter  //GPT 활용
                                {
                                    $0.isEnd == false
                                }
                                .count
                                
                                Image(systemName: "calendar.circle.fill")
                                    .font(.system(size: 30))
                                Spacer()
                                
                                Text("\(scheduleCountValue)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                            Text("예정")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .background(Color(.white))
                        .cornerRadius(12)
                    }
                    
                    NavigationLink(destination: AllScheduleView(items: items))
                    {
                        VStack
                        {
                            HStack
                            {
                                Image(systemName: "calendar.circle.fill")
                                    .font(.system(size: 30))
                                Spacer()
                                
                                Text("\(items.count)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                            Text("전체")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .background(Color(.white))
                        .cornerRadius(12)
                    }
                    
                    NavigationLink(destination: EndScheduleView())
                    {
                        VStack
                        {
                            HStack
                            {
                                let isEndCountValue = items.filter  //GPT 활용
                                {
                                    $0.isEnd == true
                                }
                                .count
                                
                                Image(systemName: "calendar.circle.fill")
                                    .font(.system(size: 30))
                                Spacer()
                                
                                Text("\(isEndCountValue)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                            Text("완료됨")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .background(Color(.white))
                        .cornerRadius(12)
                    }

                }
                
//                Section
//                {
//                    NavigationLink
//                    {
//                        TodayView()
//                    }
//                    label:
//                    {
//                        Text("오늘")
//                    }
//                }
//                
//                Section
//                {
//                    NavigationLink
//                    {
//                        ScheduleView(items: items)
//                    }
//                    label:
//                    {
//                        let scheduleCountValue = items.filter  //GPT 활용
//                        {
//                            $0.isEnd == false
//                        }
//                        .count
//                        
//                        Text("예정 \(scheduleCountValue)")
//                    }
//                }
//                
//                Section
//                {
//                    NavigationLink
//                    {
//                        AllScheduleView(items: items)
//                    }
//                    label:
//                    {
//                        Text("전체 \(items.count)")
//                    }
//                }
//                
//                Section
//                {
//                    NavigationLink
//                    {
//                        EndScheduleView()
//                    }
//                    label:
//                    {
//                        let isEndCountValue = items.filter  //GPT 활용
//                        {
//                            $0.isEnd == true
//                        }
//                        .count
//                        
//                        Text("완료됨 \(isEndCountValue)")
//                    }
//                }
                
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
                    .foregroundStyle(.black)
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
//            .listStyle(.plain)
//            .background(Color(.lightGray))
//            .scrollContentBackground(.hidden) // ✅ 기본 `List` 배경 제거
//            .background(Color(UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0))) // ✅ 리스트 전체 배경색 변경
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
