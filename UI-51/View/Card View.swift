//
//  Card View.swift
//  UI-51
//
//  Created by にゃんにゃん丸 on 2020/11/27.
//

import SwiftUI

struct Card_View: View {
    var item : Item
    var body: some View {
       
        HStack{
            
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 3.2)
            
            VStack(alignment: .leading, spacing: 10){
                
                
                Text(item.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Text(item.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
                Text(item.price)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            
                
            }
            Spacer(minLength: 0)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)
        

    }
}


