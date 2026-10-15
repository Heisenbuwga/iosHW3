import SwiftUI

/// 透過 property 客製圖片、大小、上線狀態與群組形狀。
struct AvatarView: View {
    let assetName: String
    var size: CGFloat = 52
    var online = false
    var isGroup = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(assetName).resizable().scaledToFill()
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: isGroup ? size * 0.32 : size / 2))
            if online {
                Circle().fill(Color(red: 0.26, green: 0.70, blue: 0.51))
                    .frame(width: size * 0.25, height: size * 0.25)
                    .overlay(Circle().stroke(DiscordTheme.background, lineWidth: 3))
                    .offset(x: 1, y: 1)
            }
        }
        .accessibilityLabel(online ? "頭像，在線上" : "頭像")
    }
}
