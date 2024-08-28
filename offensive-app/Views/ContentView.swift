//
//  ContentView.swift
//  offensive-app
//
//  Created by Vlad Andres on 14/08/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        Text(viewModel.data)
            .padding()
    }
}

#Preview {
    ContentView()
}
