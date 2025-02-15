//
//  EndSchedule.swift
//  remindersProject
//
//  Created by 김태건 on 2/2/25.
//

import SwiftUI

struct EndScheduleView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("EndScheduleView")
    }
}

#Preview {
    EndScheduleView()
}
