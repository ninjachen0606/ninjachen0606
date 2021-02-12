//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by 宇宣 Chen on 2021/2/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            screen(title: "Home",
                   text: "First Screen",
                   imageName: "house",
                   ContinueButtonColor: .red)
        }
    }
}


struct screen: View{
    let title:String
    let text:String
    let imageName:String
    let ContinueButtonColor: Color
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            
            Text(text)
                .font(.system(size: 30, weight: .light, design: .default))
                .padding()
            NavigationLink(
                destination: screen(title: "Second",
                                    text: "Second Screen",
                                    imageName: "bell",
                                    ContinueButtonColor: .blue),
    
                label: {
                    ContinueButton(color: ContinueButtonColor)
                    
                })
        }
        .navigationTitle(title)
    }

}

struct ContinueButton: View {
    let color: Color
    
    var body: some View {
      
        
        Text("Continue")
            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
