//
//  AllScheduleView.swift
//  remindersProject
//
//  Created by 김태건 on 2/2/25.
//

import SwiftUI

struct AllScheduleView: View
{
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditing: Bool = false
//    @State private var editTitle: String = ""
//    @State private var editContent: String = ""
//    @State private var editingItemID: String? = nil
    @State private var editingItem: Item? = nil
    
    var items: [Item]
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
                Section(header: Text("미리 알림")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue))
                {
                    ForEach(items)
                    { item in
                        HStack
                        {
                            Image(systemName: item.isEnd ? "largecircle.fill.circle" : "circle")
                                .foregroundStyle(item.isEnd ? .blue : .gray)
                                .strikethrough(item.isEnd)
                                .onTapGesture
                                {
                                    item.isEnd.toggle()
                                }
                            
                            VStack
                            {
//                                if (editingItemID == item.id)
//                                {
//                                    TextField(item.title, text: $editTitle)
//                                    TextField(item.content ?? "", text: $editContent)
//                                        .font(.footnote)
//                                        .foregroundStyle(.gray)
//                                    Button("완료")
//                                    {
//                                        saveChanges(for: item)
//                                    }
//                                }
//                                else
//                                {
//                                    Text(item.title)
//                                        .foregroundStyle(item.isEnd ? .gray : .black)
//                                    Text(item.content ?? "")
//                                        .font(.footnote)
//                                        .foregroundStyle(.gray)
//                                }
                                
                                if editingItem?.id == item.id {
//                                    EditableTextField(item: $editingItem) // ✅ 아이템을 `Binding`으로 전달
                                    TextField(item.title, text: Binding(
                                        get: { item.title },
                                        set: { item.title = $0 }
                                    ))
                                    .onSubmit {
                                        saveChanges() // ✅ 엔터 키 입력 시 자동 저장
                                    }
                                    
                                    TextField(item.content ?? "", text: Binding(
                                        get: { item.content ?? "" },
                                        set: { item.content = $0 }
                                    ))
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                                    .onSubmit {
                                        saveChanges() // ✅ 엔터 키 입력 시 자동 저장
                                    }
                                } else {
                                    Text(item.title)
                                        .foregroundStyle(item.isEnd ? .gray : .black)
                                    Text(item.content ?? "")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                }
                                
                            }
                            .onTapGesture  //GPT 참고
                            {
                                startEditing(item: item)
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
            }
            .navigationBarBackButtonHidden(true)  //GPT 참고
            .navigationTitle("전체")
            .toolbar
            {
                ToolbarItem(placement: .topBarLeading)  //GPT 참고
                {
                    Button
                    {
                        dismiss()
                    }
                    label:
                    {
                        HStack {
                            Image(systemName: "chevron.left")
                                .bold()
                            Text("목록")
                        }
                    }
                }
                
                ToolbarItem(/*placement: .topBarLeading*/)  //GPT 참고
                {
                    Button
                    {
                        print("[D]메뉴 버튼")
                    }
                    label:
                    {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }
    }
    
    // GPT 참고
    // ✅ 특정 아이템만 수정 모드로 변경
    private func startEditing(item: Item)
    {
//        editingItemID = item.id // 수정 중인 아이템의 ID 저장
//        editTitle = item.title
//        editContent = item.content ?? ""
        editingItem = item // ✅ 현재 수정 중인 아이템을 직접 저장
    }
    
//    // GPT 참고
//    // ✅ 수정 완료 시 데이터 저장
//    private func saveChanges(for item: Item)
//    {
//        // ✅ SwiftData의 modelContext를 사용하여 직접 객체 수정
//        item.title = editTitle
//        item.content = editContent
//        try? modelContext.save() // ✅ 변경 사항을 저장 (SwiftData에 반영)
//        
//        editingItemID = nil // ✅ 수정 모드 종료
//    }
    // ✅ 자동 저장 기능
    private func saveChanges() {
//        if let item = editingItem {
        if editingItem != nil {
            try? modelContext.save() // ✅ SwiftData에 변경 사항 저장
            editingItem = nil // ✅ 수정 모드 종료
        }
    }
    
    private func deleteItems(offsets: IndexSet)
    {
        withAnimation
        {
            for index in offsets
            {
                modelContext.delete(items[index])
            }
        }
    }
}

////GPT 참고
//struct EditableTextField: View {
//    @Binding var item: Item? // ✅ `Binding`을 사용하여 원본 데이터와 동기화
//
//    var body: some View {
//        VStack {
//            if let item = item { // ✅ 옵셔널 바인딩
//                TextField(item.title, text: Binding(
//                    get: { item.title },
//                    set: { item.title = $0 }
//                ))
//                
//                TextField(item.content ?? "", text: Binding(
//                    get: { item.content ?? "" },
//                    set: { item.content = $0 }
//                ))
//                .font(.footnote)
//                .foregroundStyle(.gray)
//
//                Button("완료") {
//                    saveChanges()
//                }
//            }
//        }
//    }
//    
//    private func saveChanges() {
//        try? item?.modelContext?.save() // ✅ SwiftData에 변경 사항 저장
//        item = nil // ✅ 수정 모드 종료
//    }
//}

//#Preview {
//    AllScheduleView()
//}
