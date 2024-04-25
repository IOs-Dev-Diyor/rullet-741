//
//  TabStackItemModel.swift
//  MilanTabbar
//
//  Created by mac on 21/10/21.
//

import Foundation

class TabStackItemModel {
    
    var title: String
    var image: String
    var isSelected: Bool
    
    init(title: String,
         image: String,
         isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
    
}
