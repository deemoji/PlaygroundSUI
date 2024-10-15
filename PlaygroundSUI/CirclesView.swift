//
//  CirclesView.swift
//  PlaygroundSUI
//
//  Created by Дмитрий Мартьянов on 25.09.2024.
//

import SwiftUI


struct CirclesView: View {
    
    let circleSize: CGFloat = 80.0
    @Binding var circles: [CircleView]
    
    var body: some View {
        GeometryReader { reader in
            ForEach(circles) { circle in
                Circle()
                    .frame(width: circleSize, height: circleSize)
                    .position(circle.position)
                    .foregroundColor(circle.color)
            }
            .onAppear {
                circles[0].position = CGPoint(x: reader.size.width / 2, y: reader.size.height / 4)
                circles[1].position = CGPoint(x: reader.size.width / 4, y: reader.size.height * 3 / 4)
                circles[2].position = CGPoint(x: reader.size.width * 3 / 4, y: reader.size.height * 3 / 4)
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
        
    }
    
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView(circles: .constant([
            CircleView(color: .red, position: .zero),
            CircleView(color: .green, position: .zero),
            CircleView(color: .blue, position: .zero)
        ]))
    }
}
