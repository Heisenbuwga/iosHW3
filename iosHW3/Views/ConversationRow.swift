import SwiftUI

struct ConversationRow: View {
    let conversation: Conversation

    var body: some View {
        HStack(spacing: 12) {
            AvatarView(assetName: conversation.avatar, online: conversation.online, isGroup: conversation.isGroup)
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .firstTextBaseline) {
                    Text(conversation.name).font(.system(size: 16, weight: .bold))
                        .foregroundStyle(DiscordTheme.primary).lineLimit(1)
                    Spacer(minLength: 4)
                    Text(conversation.time).font(.system(size: 11, weight: .medium))
                        .foregroundStyle(DiscordTheme.secondary)
                }
                HStack(spacing: 6) {
                    Text(conversation.message).font(.system(size: 14))
                        .foregroundStyle(conversation.unread > 0 ? DiscordTheme.primary : DiscordTheme.secondary)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                    if conversation.unread > 0 {
                        Text("\(conversation.unread)").font(.system(size: 11, weight: .bold))
                            .foregroundStyle(.white).frame(minWidth: 20, minHeight: 20)
                            .background(DiscordTheme.blurple, in: Capsule())
                    }
                }
            }
        }
        .padding(.horizontal, 4).padding(.vertical, 13)
    }
}
