//
//  Start.swift
//  TapGame
//
//  Created by Luis Filipe Pedroso on 21/05/25.
//

import Combine
import SwiftUI

struct Start: View {
    @ObservedObject var viewModel: ViewModel

    @State private var selectedDifficulty = "Select the difficulty level"

    var body: some View {
        VStack {
            HStack {
                Menu(selectedDifficulty) {
                    ForEach([Difficulty.easy, .medium, .hard], id: \.self) { difficulty in
                        Button(
                            difficulty.title,
                            action: {
                                selectedDifficulty = "Playing with \(difficulty.title) difficulty"
                                viewModel.cancellable?.cancel()
                                viewModel.timer = Timer.publish(
                                    every: Difficulty.easy.rawValue, on: .main, in: .common)

                            })

                    }
                }
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.black)
            }

            Button {
                viewModel.targetIndex = Int.random(in: 0...3)
                viewModel.activeScreen = .play
                viewModel.cancellable = viewModel.timer.connect()
            } label: {
                Text("Start")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 48)
                    .background(.purple.gradient, in: .capsule)
                    .padding(.top, 32)
            }
        }
        .padding(.horizontal, 22)
    }
}

#Preview {
    Start(viewModel: .init())
}
