//
//  ContentView.swift
//  CustomLoaderSwiftUI
//
//  Created by Mantosh Kumar on 31/05/25.
//  https://blog.stackademic.com/swiftui-custom-spinning-loader-7070039ac3e8

import SwiftUI

struct ContentView: View {
    
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(.orange)
                .ignoresSafeArea()
            
            Button("Click me!") {
                isLoading = true
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
            
            if isLoading {
                CustomSpinner()
            }
        }
        .onAppear {
            // two onAppear can be possible. 
        }
    }
}

#Preview {
    ContentView()
}
