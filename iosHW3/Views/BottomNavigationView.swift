import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
        HStack(spacing: 0) {
            tab(symbol: "server.rack", title: "伺服器")
            tab(symbol: "bubble.left.and.bubble.right.fill", title: "訊息", selected: true)
            tab(symbol: "bell.fill", title: "通知")
            VStack(spacing: 5) {
                AvatarView(assetName: "AvatarLeo", size: 26, online: true)
                Text("你").font(.system(size: 10, weight: .semibold))
            }
            .foregroundStyle(DiscordTheme.secondary).frame(maxWidth: .infinity)
        }
        .padding(.top, 12).padding(.bottom, 8)
        .background(DiscordTheme.tabBar.ignoresSafeArea(edges: .bottom))
        .overlay(alignment: .top) {
            Rectangle().fill(DiscordTheme.secondary.opacity(0.12)).frame(height: 0.5)
        }
    }

    private func tab(symbol: String, title: String, selected: Bool = false) -> some View {
        VStack(spacing: 5) {
            Image(systemName: symbol).font(.system(size: 23, weight: .semibold)).frame(height: 26)
            Text(title).font(.system(size: 10, weight: .semibold))
        }
        .foregroundStyle(selected ? DiscordTheme.primary : DiscordTheme.secondary)
        .frame(maxWidth: .infinity)
    }
}
