import SwiftUI

/// 依手機版 Discord「#一般」截圖製作的單頁靜態畫面。
struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            ChannelHeaderView(channel: "一般", onlineCount: 15, unreadCount: 2)
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ChatMessageRow(message: ChatMessage.samples[0])
                    HStack(spacing: 10) {
                        Rectangle().frame(height: 0.5)
                        Text("October 14, 2026")
                            .font(.system(size: 12, weight: .semibold)).fixedSize()
                        Rectangle().frame(height: 0.5)
                    }
                    .foregroundStyle(DiscordTheme.secondary)
                    .padding(.horizontal, 13).padding(.vertical, 12)
                    ForEach(Array(ChatMessage.samples.dropFirst())) { message in
                        ChatMessageRow(message: message)
                    }
                    Text("探索 [Discord](https://discord.com)・和朋友保持聯繫")
                        .font(.footnote).tint(DiscordTheme.link)
                        .foregroundStyle(DiscordTheme.secondary)
                        .padding(.top, 24).padding(.bottom, 16)
                }
                .padding(.top, 14)
            }
            .scrollIndicators(.hidden)
            MessageComposerView(channel: "一般")
        }
        .foregroundStyle(DiscordTheme.primary)
        .background(DiscordTheme.background)
    }
}

#Preview("深色模式") { ContentView().preferredColorScheme(.dark) }
#Preview("一般模式") { ContentView().preferredColorScheme(.light) }
