//
//  ScheduleView.swift
//  remindersProject
//
//  Created by 김태건 on 2/2/25.
//

import SwiftUI

struct ScheduleView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var items: [Item]
    
    var body: some View {
        Text("ScheduleView")
    }
}

//#Preview {
//    ScheduleView()
//}
