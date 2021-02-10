//
//  ContentView.swift
//  hellowtest
//
//  Created by 宇宣 Chen on 2021/2/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //create a navigation bar
        NavigationView {
            List(0 ..< 20) { item in
                //link to next page
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        Image(systemName: "link")
                            .resizable()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        //leading(最左)
                        VStack(alignment: .leading, spacing: 0) {
                        
                            Text("Hello, world!")
                                .foregroundColor(.blue)
                            Text("go to hell")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    })
            
            }
            //set NavigationView.navigationTitile 
            .navigationTitle(Text("Navigation Bar"))
          
            
            
        }
       
  
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
