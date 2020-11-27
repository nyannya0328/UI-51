//
//  TabBar.swift
//  UI-51
//
//  Created by にゃんにゃん丸 on 2020/11/27.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = "Home"
    var color1 = Color(#colorLiteral(red: 0.3160049229, green: 0.6348726455, blue: 0.8347335188, alpha: 1))
    var color2 = Color(#colorLiteral(red: 1, green: 0.4629976455, blue: 1, alpha: 1))
    var body: some View {
        
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            
            TabView(selection:$current){
                
               Home()
                    .tag("Home")
                
                Text("Message")
                    .tag("Message")
                
                Text("Account")
                    .tag("Account")
                
                
                
            }
            
            HStack{
            
            TabButton(title: "Home", image: "h", selected: $current)
            Spacer(minLength: 0)
                
            
            
            TabButton(title: "Message", image: "m", selected: $current)
            Spacer(minLength: 0)
            
            TabButton(title: "Account", image: "a", selected: $current)
            Spacer(minLength: 0)
                
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(
            
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
            
            )
            .clipShape(Capsule())
            .padding(.horizontal)
            
        }
       
    }
}

