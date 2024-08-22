//
//  ContentView.swift
//  offensive-app
//
//  Created by Vlad Andres on 14/08/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dataFetcher = DataFetcher()

    var body: some View {

        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(dataFetcher.data)
                .onAppear {
                    dataFetcher.fetchData()
                }
                .padding()
        }
        .padding()
    }
    
//    func startBackgroundTask() {
//        Timer.scheduledTimer(withTimeInterval: 6.0, repeats: true) { _ in
//            fetchData()
//        }
//    }
    
    class DataFetcher: ObservableObject {
        @Published var data: String = "Fetching..."
        private var url: URL = URL(string: "https://evilinsult.com/generate_insult.php?lang=en&type=json")!
        
        var timer: Timer?

        init() {
            startTimer()
        }

        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                self.fetchData()
            }
        }

        func fetchData() {
            var test: String = String(Int.random(in: 1..<9))
            data = test
            print(test)
//
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print("Sending..." . data)
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    print("Got it")
                    DispatchQueue.main.async {
                        self.data = responseString
                    }
                }
            }
//    
//            task.resume()
        }
    }

}

#Preview {
    ContentView()
}
