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
                        VStack
                        {
                            HStack
                            {
                                Image(systemName: item.isEnd ? "largecircle.fill.circle" : "circle")
                                    .foregroundStyle(item.isEnd ? .blue : .gray)
                                    .strikethrough(item.isEnd)
                                    .onTapGesture {
                                        item.isEnd.toggle()
                                    }
                                Text(item.title)
                                    .foregroundStyle(item.isEnd ? .gray : .black)
                            }
                            Text(item.content ?? "")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationBarBackButtonHidden(true)  //GPT 참고
            .navigationTitle("전체")
            .toolbar
            {
                ToolbarItem(placement: .topBarLeading) {  //GPT 참고
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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
}

//#Preview {
//    AllScheduleView()
//}
