//
//  ViewModel.swift
//  TapGame
//
//  Created by Luis Filipe Pedroso on 21/05/25.
//
import Combine
import Foundation

class ViewModel: ObservableObject {

    @Published var selectedImgIndex = 0
    @Published var targetIndex = 1
    @Published var activeScreen: Screen = .start
    @Published var failed = false
    @Published var score = 0

    var timer = Timer.publish(every: 1, on: .main, in: .common)
    var cancellable: Cancellable?
}
