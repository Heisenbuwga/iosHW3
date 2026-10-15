import SwiftUI

struct ActivityCard: View {
    let name: String
    let avatar: String
    let activity: String
    let symbol: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                AvatarView(assetName: avatar, size: 32)
                Text(name).font(.system(size: 14, weight: .bold)).lineLimit(1)
                Spacer(minLength: 0)
            }
            HStack(spacing: 5) {
                Image(systemName: symbol).foregroundStyle(color)
                Text(activity).lineLimit(1).minimumScaleFactor(0.8)
            }
            .font(.system(size: 11, weight: .medium)).foregroundStyle(DiscordTheme.secondary)
        }
        .padding(12).frame(maxWidth: .infinity, alignment: .leading)
        .background(DiscordTheme.surface, in: RoundedRectangle(cornerRadius: 18))
    }
}
