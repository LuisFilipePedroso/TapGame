import SwiftUI

struct Play: View {
    @ObservedObject var viewModel: ViewModel

    private let imgs = ["serious", "ignoring", "smiling", "what"]

    var body: some View {
        VStack {
            Image(imgs[viewModel.selectedImgIndex])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture {
                    if viewModel.selectedImgIndex == viewModel.targetIndex {
                        viewModel.score += 1
                        viewModel.failed = false
                    } else {
                        viewModel.score = max(viewModel.score - 1, 0)
                        viewModel.failed = true
                    }

                    viewModel.cancellable?.cancel()
                    viewModel.timer = Timer.publish(
                        every: Difficulty.easy.rawValue, on: .main, in: .common)
                    viewModel.activeScreen = .result
                }
            Text("You should tap on the image where\nLina is \(imgs[viewModel.targetIndex])")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.top, 16)
        }
        .onReceive(
            viewModel.timer,
            perform: { _ in
                changeImg()
            }
        )
    }

    private func changeImg() {
        viewModel.selectedImgIndex = (viewModel.selectedImgIndex + 1) % imgs.count
    }
}
