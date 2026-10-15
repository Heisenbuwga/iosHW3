import SwiftUI

/// Asset Color Set 的 Any / Dark 配色會自動跟隨系統外觀。
enum DiscordTheme {
    static let background = Color("DiscordBackground")
    static let surface = Color("DiscordSurface")
    static let primary = Color("DiscordPrimary")
    static let secondary = Color("DiscordSecondary")
    static let tabBar = Color("DiscordTabBar")
    static let link = Color("DiscordLink")
    static let blurple = Color(red: 88 / 255, green: 101 / 255, blue: 242 / 255)
}

struct Conversation: Identifiable {
    let id: Int
    let name: String
    let avatar: String
    let message: String
    let time: String
    var online = false
    var unread = 0
    var isGroup = false

    static let samples: [Conversation] = [
        .init(id: 0, name: "週五不睡覺 🎮", avatar: "AvatarSpace", message: "Mochi：大家今晚幾點上線？", time: "2 分鐘", unread: 3, isGroup: true),
        .init(id: 1, name: "Mochi", avatar: "AvatarMochi", message: "傳送了一張圖片。", time: "5 分鐘", online: true, unread: 1),
        .init(id: 2, name: "Yuki", avatar: "AvatarYuki", message: "這首真的超好聽 🎧", time: "12 分鐘", online: true),
        .init(id: 3, name: "Alan", avatar: "AvatarAlan", message: "好啊，等等語音見！", time: "28 分鐘", online: true),
        .init(id: 4, name: "設計靈感研究所 ✨", avatar: "AvatarDesign", message: "Nina：分享一下今天的新發現", time: "1 小時", isGroup: true),
        .init(id: 5, name: "Nina", avatar: "AvatarNina", message: "你看過這個設計了嗎？", time: "2 小時"),
        .init(id: 6, name: "Leo", avatar: "AvatarLeo", message: "明天一起去喝咖啡 ☕", time: "3 小時"),
        .init(id: 7, name: "Swift 學習小隊", avatar: "AvatarSpace", message: "你：我的畫面終於完成了！", time: "昨天", isGroup: true),
        .init(id: 8, name: "Hana", avatar: "AvatarYuki", message: "週末見！", time: "昨天"),
        .init(id: 9, name: "Kai", avatar: "AvatarAlan", message: "感謝分享 🙌", time: "星期二")
    ]
}
