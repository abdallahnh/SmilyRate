//
//  ANStackView.swift
//  SmilyRate
//
//  Created by Abdallah Nehme on 09/10/2021.
//

import Foundation
class ANStackView {
    var style:Style!
    init(style: Style){
        self.style = style
    }
    enum Style {
        case h(distribution: UIStackView.Distribution, spacing: CGFloat?)
        case v(distribution: UIStackView.Distribution, spacing: CGFloat?)
    }
    var view: UIStackView {
        let sv = UIStackView()

        switch self.style {
        case .h(let distribution, let spacing ):
            sv.axis = .horizontal
            sv.alignment = .fill
            sv.distribution = distribution
            sv.spacing = spacing ?? 0
            break
        case .v(let distribution, let spacing ):
            sv.axis = .vertical
            sv.alignment = .fill
            sv.distribution = distribution
            sv.spacing = spacing ?? 0
            break
        default:
            sv.axis = .horizontal
            sv.alignment = .fill
            sv.distribution = .fill
            sv.spacing = 0
            break
        }
        return sv
    }

}
