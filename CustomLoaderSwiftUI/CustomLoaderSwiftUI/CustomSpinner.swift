//
//  CustomSpinner.swift
//  CustomLoaderSwiftUI
//
//  Created by Mantosh Kumar on 31/05/25.
//

import SwiftUI

struct CustomSpinner: View {
    
    @State private var rotationAngle = 0.0
    private let ringSize: CGFloat = 50
    
    var colors: [Color] = [Color.orange, Color.orange.opacity(0.3)]
    
    var body: some View {
        
        Rectangle()
            .fill(.gray.opacity(0.3))
            .ignoresSafeArea()
        
        VStack {
            ZStack {
                Circle()
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: colors),
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360)
                        ),
                        style: StrokeStyle(lineWidth: 5, lineCap: .round)
                    )
                    .frame(width: ringSize, height: ringSize)
                    .rotationEffect(.degrees(rotationAngle))
                    .padding()
            }
            Text("Laoding...")
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 30)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
        .onAppear {
            withAnimation(.linear(duration: 1.2)
                .repeatForever(autoreverses: false)) {
                    rotationAngle = -360.0
                }
        }
        .onDisappear{
            rotationAngle = 0.0
        }
    }
}
