import SwiftUI

struct ChatMessageRow: View {
    let message: ChatMessage

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            if let reply = message.reply {
                HStack(alignment: .top, spacing: 4) {
                    ReplyConnector()
                        .stroke(DiscordTheme.secondary.opacity(0.35), lineWidth: 2)
                        .frame(width: 28, height: 24)
                        .padding(.leading, 20).padding(.top, 8)
                        .mask(alignment: .topLeading) { Rectangle().frame(height: 25) }
                    AvatarView(assetName: reply.author.avatar, size: 18)
                    (Text("@" + reply.author.name + " ").foregroundColor(reply.author.color).bold()
                     + Text(Self.formatted(reply.text)))
                        .font(.system(size: 14)).foregroundStyle(DiscordTheme.secondary)
                        .lineLimit(2)
                }
                .padding(.trailing, 8)
            }
            HStack(alignment: .top, spacing: 12) {
                AvatarView(assetName: message.author.avatar, size: 40)
                VStack(alignment: .leading, spacing: 3) {
                    ViewThatFits(in: .horizontal) {
                        authorLine
                        VStack(alignment: .leading, spacing: 2) {
                            authorName
                            Text(message.time).font(.system(size: 12)).foregroundStyle(DiscordTheme.secondary)
                        }
                    }
                    Text(Self.formatted(message.text))
                        .font(.system(size: 16)).lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding(.leading, 16).padding(.trailing, 12)
        .padding(.vertical, message.highlighted ? 4 : 5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(message.highlighted ? Color("DiscordMentionRow") : .clear)
        .overlay(alignment: .leading) {
            if message.highlighted { Rectangle().fill(Color(red: 0.91, green: 0.67, blue: 0.20)).frame(width: 2) }
        }
        .padding(.bottom, message.id == 0 ? 0 : 10)
    }

    private var authorLine: some View {
        HStack(alignment: .firstTextBaseline, spacing: 6) {
            authorName
            Text(message.time).font(.system(size: 12)).foregroundStyle(DiscordTheme.secondary)
        }.fixedSize(horizontal: true, vertical: false)
    }

    private var authorName: some View {
        HStack(spacing: 4) {
            Text(message.author.name).font(.system(size: 16, weight: .semibold))
                .foregroundStyle(message.author.color)
            if let badge = message.author.badge {
                Text(badge).font(.system(size: 12, weight: .semibold))
                    .padding(.horizontal, 4).padding(.vertical, 1)
                    .background(DiscordTheme.surface, in: RoundedRectangle(cornerRadius: 3))
            }
        }
    }

    /// AttributedString 保留行內換行，並為 @提及加上獨立的文字與背景色。
    static func formatted(_ text: String) -> AttributedString {
        var result = AttributedString(text)
        for name in ["@MidnightFox", "@橘子汽水", "@Mochi", "@晴"] {
            if let range = result.range(of: name) {
                result[range].foregroundColor = Color("DiscordMentionText")
                result[range].backgroundColor = Color("DiscordMentionBackground")
                result[range].font = .system(size: 16, weight: .semibold)
            }
        }
        return result
    }
}

/// 回覆線僅繪出左側與上緣，讓引文和原訊息連接。
private struct ReplyConnector: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 6))
        path.addQuadCurve(to: CGPoint(x: 6, y: 0), control: .zero)
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
