//
//  AddReminderView.swift
//  remindersProject
//
//  Created by 김태건 on 2/2/25.
//

import SwiftUI

struct AddReminderView: View
{
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var addTitle: String = ""
    @State private var addContent: String = ""
    
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                Section
                {
                    TextField("제목", text: $addTitle)
                    TextField("메모", text: $addContent)
                }
                
                Section
                {
                    Text("세부사항")
                }
                
                Section
                {
                    Text("목록")
                }
            }
            .toolbar
            {
                ToolbarItem(placement: .topBarLeading)
                {
                    Button
                    {
                        print("[D]취소 버튼")
                        dismiss()
                    }
                    label:
                    {
                        Text("취소")
                    }
                }
                
                ToolbarItem(placement: .principal)  //GPT 참고
                {
                    Text("새로운 미리 알림")
                }
                
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button
                    {
                        print("[D]추가 버튼")
                        let newReminderData = Item(title: addTitle, content: addContent)
                        modelContext.insert(newReminderData)
                        dismiss()
                    }
                    label:
                    {
                        Text("추가")
                    }
                }

            }
        }
    }
}

#Preview
{
    AddReminderView()
}
