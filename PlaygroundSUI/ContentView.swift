//
//  ContentView.swift
//  PlaygroundSUI
//
//  Created by Дмитрий Мартьянов on 23.08.2024.
//

import SwiftUI

struct CircleView: Identifiable {
    let id = UUID()
    let color: Color
    var position: CGPoint
}

struct ContentView: View {
    @State private var circles: [CircleView] = [
        CircleView(color: .red, position: .zero),
        CircleView(color: .green, position: .zero),
        CircleView(color: .blue, position: .zero)
    ]
    
    var body: some View {
        VStack {
            CirclesView(circles: $circles)
            Button("Switch Positions") {
                switchPositions()
            }
        }
    }
    
    private func switchPositions() {
        withAnimation(.easeInOut(duration: 0.5)){
            let lastPosition = circles[2].position
            circles[2].position = circles[1].position
            circles[1].position = circles[0].position
            circles[0].position = lastPosition
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
