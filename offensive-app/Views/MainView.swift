//
//  MainView.swift
//  offensive-app
//
//  Created by Vlad Andres on 28/08/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        Text(viewModel.data)
            .padding()
    }
}

#Preview {
    MainView()
}
