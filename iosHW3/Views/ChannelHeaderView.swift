import SwiftUI

struct ChannelHeaderView: View {
    let channel: String
    let onlineCount: Int
    let unreadCount: Int

    var body: some View {
        HStack(spacing: 18) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "arrow.left").font(.system(size: 24, weight: .medium))
                    .frame(width: 28, height: 36)
                Text("\(unreadCount)").font(.system(size: 11, weight: .bold))
                    .foregroundStyle(.white).frame(width: 16, height: 16)
                    .background(Color(red: 0.86, green: 0.16, blue: 0.23), in: Circle())
                    .offset(x: 4, y: 4)
            }
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text("#").font(.system(size: 22))
                    Text(channel).font(.system(size: 22, weight: .bold))
                    Image(systemName: "chevron.right").font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(DiscordTheme.secondary)
                }
                .foregroundStyle(DiscordTheme.primary)
                HStack(spacing: 8) {
                    Circle().fill(Color(red: 0.23, green: 0.64, blue: 0.40)).frame(width: 8, height: 8)
                    Text("\(onlineCount) 位上線").font(.system(size: 14))
                }
            }
            Spacer()
            Image(systemName: "magnifyingglass").font(.system(size: 21)).padding(.trailing, 8)
        }
        .foregroundStyle(DiscordTheme.secondary)
        .padding(.horizontal, 18).padding(.top, 5).padding(.bottom, 8)
        .overlay(alignment: .bottom) {
            Rectangle().fill(DiscordTheme.secondary.opacity(0.16)).frame(height: 0.5)
        }
    }
}
