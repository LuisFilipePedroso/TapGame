import SwiftUI

struct Result: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            if viewModel.failed {
                Text("Mission failed.\nBetter luck next time!")
                    .font(.system(size: 22, weight: .semibold))
                    .multilineTextAlignment(.center)
            } else {
                Text("Mission accomplished 🚀!")
                    .font(.system(size: 22, weight: .semibold))
            }

            (Text("Your score is ") + Text("\(viewModel.score)").bold())
                .font(.system(size: 18, weight: .medium))
                .padding(.top, 16)
                .padding(.bottom, 8)

            Button {
                viewModel.selectedImgIndex = Int.random(in: 0..<4)
                viewModel.targetIndex = Int.random(in: 0...4)
                viewModel.activeScreen = .play
                viewModel.cancellable = viewModel.timer.connect()
            } label: {
                Text("Play Again")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 48)
                    .background(.purple.gradient, in: .capsule)
                    .padding(.top, 32)
            }
        }
        .padding(.horizontal, 22)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Result(viewModel: .init())
}
