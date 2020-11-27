//
//  ContentView.swift
//  UI-51
//
//  Created by にゃんにゃん丸 on 2020/11/27.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
       TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
