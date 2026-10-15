import SwiftUI

/// 作業為靜態畫面，輸入列以 Text 及 SF Symbols 呈現。
struct MessageComposerView: View {
    let channel: String
    var body: some View {
        HStack(spacing: 18) {
            Image(systemName: "plus").font(.system(size: 25, weight: .light))
            Text("傳訊息到 #\(channel)").font(.system(size: 16)).lineLimit(1)
            Spacer(minLength: 0)
            Image(systemName: "gift.fill")
            Image(systemName: "face.smiling.fill")
            Image(systemName: "mic.fill")
        }
        .font(.system(size: 20))
        .foregroundStyle(DiscordTheme.secondary)
        .padding(.horizontal, 18).frame(height: 56)
        .background(DiscordTheme.surface, in: RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(DiscordTheme.secondary.opacity(0.06), lineWidth: 1))
        .padding(.horizontal, 16).padding(.top, 8).padding(.bottom, 12)
    }
}
