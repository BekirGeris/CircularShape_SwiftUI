//
//  Circular.swift
//  CircularShapeAnimationApp
//
//  Created by Bekir Geriş on 3.10.2023.
//

import SwiftUI

struct Circular: View {
    
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percentage: Double
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                CircularShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                CircularShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(foregroundColor)
            }
            .animation(.easeIn(duration: 1), value: percentage)
            .padding(20)
        })
    }
}

#Preview {
    Circular(lineWidth: 30, backgroundColor: .red.opacity(0.2), foregroundColor: .red, percentage: 35)
}
