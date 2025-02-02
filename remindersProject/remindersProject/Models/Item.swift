//
//  Item.swift
//  remindersProject
//
//  Created by 김태건 on 1/22/25.
//

import Foundation
import SwiftData

@Model
final class Item
{
    //알림 ID
    var id: String = UUID().uuidString
    //알림 제목
    var title: String = ""
    //알림 내용
    var content: String?
    //알림 생성 날짜
    var createdDate: Date = Date()
    //알림 날짜
    var dDayDate: Date?
    //완료 판단
    var isEnd: Bool = false
    
    init(title: String,
         content: String,
         createdDate: Date = Date(),
         dDayDate: Date? = nil,
         isEnd: Bool = false)
    {
        self.title = title
        self.content = content
        self.createdDate = createdDate
        self.dDayDate = dDayDate
        self.isEnd = isEnd
    }
}
