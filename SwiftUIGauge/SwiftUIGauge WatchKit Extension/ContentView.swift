//
//  ContentView.swift
//  SwiftUIGauge WatchKit Extension
//
//  Created by 宇宣 Chen on 2021/2/12.
//

import SwiftUI

var gradient = Gradient(colors: [.blue, .pink, .purple, .orange])

struct ContentView: View {
    var body: some View {
        Gauge(value: 33.0, in: 0.0...100.0){
            Text("Speed")
                .foregroundColor(Color.blue)
        } currentValueLabel: {
            Text("33")
                .foregroundColor(Color.blue)
        } minimumValueLabel: {
            Text("0")
                .foregroundColor(Color.blue)
        } maximumValueLabel: {
            Text("100")
                .foregroundColor(Color.blue)
        }
        .gaugeStyle(CircularGaugeStyle(tint: gradient))
        .frame(width: 100, height: 100, alignment: .center)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
