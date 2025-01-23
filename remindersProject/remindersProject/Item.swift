//
//  Item.swift
//  remindersProject
//
//  Created by 김태건 on 1/22/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    //알림 id
    var id: String = UUID().uuidString
    //알림 제목
    var name: String
    //알림 내용
    var content: String
    //알림 생성 날짜
    var createdAt: Date
    
    init(name: String, content: String, createdAt: Date = Date()) {
        self.name = ""
        self.content = ""
        self.createdAt = createdAt
    }
}
