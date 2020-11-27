//
//  Home.swift
//  UI-51
//
//  Created by にゃんにゃん丸 on 2020/11/27.
//

import SwiftUI

struct Home: View {
    @State var size = "Midium"
    @State var currenttab = "All"
    
    
    @State var items = [
        Item(title: "Simle is Best", price: "100", subtitle: "White", image: "lamp"),
        Item(title: "Chair", price: "200", subtitle: "With Cat", image: "c"),
        Item(title: "Fly Table", price: "300", subtitle: "Fly", image: "t"),]
    
    @GestureState var isDraging = false
    
    
    @State var cart : [Item] = []
    
    var body: some View {
        VStack{
            
            
            HStack{
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.black)
                    
                }
                Spacer(minLength: 0)
                
                Button(action: {}){
                    
                    Image(systemName: "cart.fill")
                        .font(.title)
                        .foregroundColor(.black)
                    
                }
                .overlay(
                    
                    Text("\(cart.count)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(width: 23, height: 23)
                        .background(Color("bg"))
                        .clipShape(Circle())
                        .offset(x: 15, y: -22)
                        .opacity(cart.isEmpty ?  0 : 1)
                
                
                )
                
            }
            .padding(.horizontal)
            .padding(.top,10)
            .padding(.bottom,30)
            
            
         
            ScrollView{
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment:.leading,spacing:15){
                            
                            
                            Text("Future in\nUnique Style")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            
                            Text("We have wide range of funitures")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                            
                            
                            
                            
                        }
                        Spacer(minLength: 15)
                        
                        
                        Menu(content: {
                            
                            
                            Button(action: {size = "small"}){
                                
                                Text("small")
                                
                            }
                            Button(action: {size = "Midium"}){
                                
                                Text("Midium")
                                
                            }
                            
                            Button(action: {size = "Large"}){
                                
                                Text("Large")
                                
                            }
                            
                            
                            
                        }){
                            
                            
                            Label(title:{
                                
                                
                                Text(size)
                                
                                
                            }){
                                
                            Image(systemName: "slider.vertical.3")
                                .foregroundColor(.white)
                            
                                
                                
                                
                                
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black)
                            .clipShape(Capsule())
                            
                            
                        }
                        
                        
                        
                        
                        
                    }
                
                .padding()
                
                
                HStack(spacing:0){
                    
                    ForEach(tabs,id:\.self){tab in
                        
                        Button(action: {
                            currenttab = tab
                        }){
                            
                            Text(tab)
                                .fontWeight(.bold)
                                .foregroundColor(currenttab == tab ? .black : .gray)
                            
                                
                            
                            
                            
                        }
                        if tab != tabs.last{Spacer(minLength: 0)}
                        
                        
                    }
                    
                }
                .padding()
                
                    ForEach(items.indices){index in
                        
                        
                        ZStack{
                            
                            Color("tab")
                                .cornerRadius(20)
                            
                            Color("co")
                                .cornerRadius(20)
                                .padding(.trailing,65)
                            
                            
                            HStack{
                                
                                
                                Spacer()
                                
                                
                                Button(action: {}) {
                                    
                                    
                                    Image(systemName: "suit.heart.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                    
                                }
                                
                                Button(action: {
                                    
                                    addCart(index: index)
                                    
                                }) {
                                    
                                    
                                    Image(systemName:CheckCart(index: index) ? "cart.badge.minus"  : "cart.badge.plus")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                        
                                    
                                }
                                
                                
                                
                                
                                
                            }
                            
                            
                            
                        
                      
                        
                        
                    
                    Card_View(item: items[index])
                        .offset(x: items[index].offset)
                        .gesture(DragGesture()
                                    
                                    .updating($isDraging, body: { (value, state, _) in
                                        state = true
                                        
                                        onchanged(value: value, index: index)
                                        
                                        
                                    })
                       .onEnded({ (value) in
                            onEnded(value: value, index: index)
                        }))
                        
                        }
                        
                        
                        
                        
                    
                    
                }
                .padding(.horizontal)
                .padding(.top)
                
                
                
                
            }
                .padding(.bottom,100)
            
           
            
            
            }
            
            
           
            
        }
    }
    
    func CheckCart(index:Int) -> Bool{
        
        return cart.contains { (item) -> Bool in
            return item.id == items[index].id
        }
        
        
    }
    
    func addCart(index:Int){
       
        if CheckCart(index: index){
            
            cart.removeAll { (item) -> Bool in
                return item.id == items[index].id
            }
        }
        else{
            
            cart.append(items[index])
            
            withAnimation{items[index].offset = 0}
                
                
                
                
            
            
        }
        
        
    }
    
    
    func onchanged(value:DragGesture.Value,index:Int){
        
        if value.translation.width < 0 && isDraging{
            
            items[index].offset = value.translation.width
            
            
            
        }
        
        
    }
    
    func onEnded(value:DragGesture.Value,index:Int){
        
        
        withAnimation{
            
            
            if -value.translation.width >= 100{
                
                items[index].offset =  -130
                
                
            }
            else {
                
                items[index].offset = 0
                
            }
        }
        
       
}

}
var tabs = ["Table","Chair","Lamp","All"]
