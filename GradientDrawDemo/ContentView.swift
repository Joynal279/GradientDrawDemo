//
//  ContentView.swift
//  GradientDrawDemo
//
//  Created by JOYNAL ABEDIN on 27/9/22.
//

import SwiftUI

struct ContentView: View {
    
    let colors = Gradient(colors: [Color.red, Color.yellow, Color.green, Color.blue, Color.purple])
    
    var body: some View {
        VStack {
            Circle()
                .fill(RadialGradient(gradient: colors, center: .center, startRadius: 0, endRadius: 300))
            Circle()
                .fill(AngularGradient(gradient: colors, center: .center))
            Rectangle()
                .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            
            MyShape()
                .fill(RadialGradient(gradient: colors, center: .center, startRadius: 0, endRadius: 300))
                .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 310, height: 300)
        }
        .padding()
    }
}

//Custom Shape Gradient
struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
