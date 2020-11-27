//
//  Item.swift
//  UI-51
//
//  Created by にゃんにゃん丸 on 2020/11/27.
//

import SwiftUI

struct Item : Identifiable {
    var id = UUID().uuidString
    var title : String
    var price : String
    var subtitle : String
    var image : String
    var offset : CGFloat = 0
}


    
    
    

