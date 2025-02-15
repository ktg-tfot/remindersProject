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
    
    let gridCell = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
//        Text("TodayView")
        
        LazyVGrid(columns: gridCell, spacing: 15)
        {
            NavigationLink
            {
                TodayView()
            }
            label:
            {
                VStack
                {
                    HStack
                    {
                        Image(systemName: "calendar.circle.fill")
                            .font(.system(size: 30))
                        Spacer()
                        
                        Text("9")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Text("abc")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 80)
                .background(Color(.gray))
                .cornerRadius(12)
            }
            
            NavigationLink
            {
                TodayView()
            }
            label:
            {
                VStack
                {
                    HStack
                    {
                        Image(systemName: "calendar.circle.fill")
                            .font(.system(size: 30))
                        Spacer()
                        
                        Text("9")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Text("abc")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 80)
                .background(Color(.gray))
                .cornerRadius(12)
            }
            
            NavigationLink
            {
                TodayView()
            }
            label:
            {
                VStack
                {
                    HStack
                    {
                        Image(systemName: "calendar.circle.fill")
                            .font(.system(size: 30))
                        Spacer()
                        
                        Text("9")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Text("abc")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 80)
                .background(Color(.gray))
                .cornerRadius(12)
            }
            
            NavigationLink
            {
                TodayView()
            }
            label:
            {
                VStack
                {
                    HStack
                    {
                        Image(systemName: "calendar.circle.fill")
                            .font(.system(size: 30))
                        Spacer()
                        
                        Text("9")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Text("abc")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 80)
                .background(Color(.gray))
                .cornerRadius(12)
            }
        }
        
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
