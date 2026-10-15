import SwiftUI

struct ChatAuthor {
    let name: String
    let avatar: String
    let color: Color
    var badge: String? = nil

    static let fish = ChatAuthor(name: "橘子汽水", avatar: "AvatarMochi", color: Color(red: 0.94, green: 0.47, blue: 0.06))
    static let wen = ChatAuthor(name: "晴", avatar: "AvatarYuki", color: Color(red: 0.13, green: 0.64, blue: 0.88), badge: "💗星空旅人")
    static let me = ChatAuthor(name: "MidnightFox", avatar: "AvatarAlan", color: Color(red: 0.76, green: 0.04, blue: 0.36))
}

struct ChatReply {
    let author: ChatAuthor
    let text: String
}

struct ChatMessage: Identifiable {
    let id: Int
    let author: ChatAuthor
    let time: String
    let text: String
    var highlighted = false
    var reply: ChatReply? = nil

    static let samples: [ChatMessage] = [
        .init(id: 0, author: .fish, time: "2026/10/13, 7:37PM", text: "@Mochi要一起嗎"),
        .init(id: 1, author: .wen, time: "昨天 6:31PM", text: "@橘子汽水"),
        .init(id: 2, author: .me, time: "昨天 7:53PM", text: "@晴 晚上八點一起來玩新的合作遊戲，大家有空嗎？"),
        .init(id: 3, author: .wen, time: "昨天 8:01PM", text: "好呀，一起玩！", highlighted: true,
              reply: .init(author: .me, text: "@晴 晚上八點一起來玩新的合作遊戲，大家有空嗎？")),
        .init(id: 4, author: .me, time: "昨天 8:02PM", text: "等我五分鐘\n@晴 我快好了"),
        .init(id: 5, author: .fish, time: "昨天 8:10PM", text: "@MidnightFox準備好了", highlighted: true),
        .init(id: 6, author: .me, time: "昨天 8:11PM", text: "九點出發吧",
              reply: .init(author: .fish, text: "@MidnightFox準備好了")),
        .init(id: 7, author: .fish, time: "昨天 8:11PM", text: "不是說八點嗎？")
    ]
}
