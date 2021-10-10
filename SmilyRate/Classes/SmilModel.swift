//
//  SmilModel.swift
//  SmilyRate
//
//  Created by Abdallah Nehme on 09/10/2021.
//

import Foundation
public final class SmilModel{
    var image: UIImage!
    let title: String!
    var selectedColor: UIColor!

    public init(image: UIImage, title: String, selectedColor: UIColor){
        self.image = image
        self.title = title
        self.selectedColor = selectedColor
    }
}
