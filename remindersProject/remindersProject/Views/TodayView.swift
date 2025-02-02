//
//  TodayView.swift
//  remindersProject
//
//  Created by 김태건 on 2/2/25.
//

import SwiftUI

struct TodayView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("TodayView")
        
//        NavigationStack
//        {
//            Form
//            {
//                
//            }
//            .toolbar
//            {
//                ToolbarItem(placement: .topBarLeading)
//                {
//                    Button
//                    {
//                        print("[D]목록 버튼")
//                        dismiss()
//                    }
//                    label:
//                    {
//                        Text("목록")
//                    }
//                }
//                
//                ToolbarItem(placement: .topBarTrailing)
//                {
//                    Button
//                    {
//                        print("[D]버튼")
//                        dismiss()
//                    }
//                    label:
//                    {
//                        Text("버튼")
//                    }
//                }
//                
//            }
//            
//        }
    }
}

#Preview {
    TodayView()
}
