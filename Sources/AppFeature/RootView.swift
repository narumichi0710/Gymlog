//
//  RootView.swift
//  App
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public struct RootView: View {
    public init() {}
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
        RootView()
    }
}
