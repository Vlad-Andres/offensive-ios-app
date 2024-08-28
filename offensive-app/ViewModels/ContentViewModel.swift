//
//  ContentViewModel.swift
//  offensive-app
//
//  Created by Vlad Andres on 28/08/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var data: String = "Fetching..."
    private var networkService = NetworkService()
    private var timer: Timer?  // Retain the timer here

    
    init() {
        print("Starting timer")
        startTimer()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            self.fetchData()
        }
    }

    func fetchData() {
        networkService.fetchData() { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.data = data
                    print("Fetched data: \(data)")
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
    
    deinit {
        timer?.invalidate()  // Invalidate the timer when the view model is deallocated
    }
}
