import Combine
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            Text("Lina's Mood Game")
                .font(.system(size: 24, weight: .semibold))
                .padding(.bottom, 8)
            Text("Let's see how fast you are")
                .font(.system(size: 18))
                .foregroundStyle(.gray)
                .padding(.bottom, 32)

            ZStack {
                switch viewModel.activeScreen {
                case .start:
                    Start(viewModel: viewModel)
                case .play:
                    Play(viewModel: viewModel)
                case .result:
                    Result(viewModel: viewModel)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: viewModel.activeScreen)
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
