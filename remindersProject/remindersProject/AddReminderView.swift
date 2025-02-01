//
//  AddReminderView.swift
//  remindersProject
//
//  Created by 김태건 on 2/2/25.
//

import SwiftUI

struct AddReminderView: View
{
    @State private var title: String = ""
    
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                Section
                {
                    Text("asd")
                }   
            }
            .toolbar
            {
                ToolbarItem(placement: .principal)
                {
                    HStack
                    {
                        Button
                        {
                            print("[D]취소 버튼")
                        }
                        label:
                        {
                            Text("취소")
                        }
                        
                        Spacer()
                        
                        Text("새로운 미리 알림")
                        
                        Spacer()
                        
                        Button
                        {
                            print("[D]추가 버튼")
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
}

#Preview
{
    AddReminderView()
}
