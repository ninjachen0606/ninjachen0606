//
//  ContentView.swift
//  SwiftUIAlert
//
//  Created by 宇宣 Chen on 2021/2/12.
//

import SwiftUI

struct ContentView: View {
    //@state let the var 
    @State private var alertPresented = false
    @State private var backgroundUpdated = false
    
    var body: some View {
        NavigationView{
            ZStack {
                if backgroundUpdated {
                    Color.green
                }
                else{
                    Color.blue
                }
                
                VStack{
                    Button(action: {
                        self.alertPresented = true
                    }, label: {
                        Text("Tap me!")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 24))
                    })
                    .frame(width: 200,
                           height: 50,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
                    .alert(isPresented: $alertPresented, content: {
                        Alert(title: Text("Would you like to purchase?"), primaryButton: .default(Text("Purchase"), action:{
                            //change backgroundUpdated false or true
                            self.backgroundUpdated.toggle()
                        }),
                        secondaryButton: .cancel(Text("No, Thanks")))
                    })
            
                    
                }
                .navigationTitle("SwiftUI Alert")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
