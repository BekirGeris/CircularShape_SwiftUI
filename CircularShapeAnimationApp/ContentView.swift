//
//  ContentView.swift
//  CircularShapeAnimationApp
//
//  Created by Bekir Geriş on 3.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstCirclePercentage: Double = 0
    @State var secondCirclePercentage: Double = 0
    @State var thirdCirclePercentage: Double = 0
    
    var body: some View {
        ZStack {
            Circular(lineWidth: 40, backgroundColor: .red.opacity(0.2), foregroundColor: .red, percentage: firstCirclePercentage)
                .frame(width: 150, height: 150)
                .onTapGesture {
                    if self.firstCirclePercentage < 100 {
                        self.firstCirclePercentage += 20
                    } else {
                        self.firstCirclePercentage = 0
                    }
                }
            Circular(lineWidth: 40, backgroundColor: .green.opacity(0.2), foregroundColor: .green, percentage: secondCirclePercentage)
                .frame(width: 250, height: 250)
                .onTapGesture {
                    if self.secondCirclePercentage < 100 {
                        self.secondCirclePercentage += 20
                    } else {
                        self.secondCirclePercentage = 0
                    }
                }
            Circular(lineWidth: 40, backgroundColor: .blue.opacity(0.2), foregroundColor: .blue, percentage: thirdCirclePercentage)
                .frame(width: 350, height: 350)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // Burada parmağın kaydırma mesafesine göre değeri artırabilirsiniz
                            let delta = value.translation.width
                            let increment = delta / 50 // Değeri artırma hızını ayarlayabilirsiniz
                            self.thirdCirclePercentage += increment
                            if self.thirdCirclePercentage > 100 {
                                self.thirdCirclePercentage = 100
                            }
                        }
                        .onEnded { _ in
                            // Parmağı bıraktığınızda gerekirse ek işlem yapabilirsiniz
                        }
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
