//
//  SmilyRateView.swift
//  SmilyRate
//
//  Created by Abdallah Nehme on 09/10/2021.
//

import UIKit

class SmilyRateView: UIView {

    // MARK: - Var
    private var stackView: ANStackView!
    private var smiling: [SmilModel]!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Public Functions
    func setSmiling(smiling: [SmilModel]){
        for smil in smiling {
            let stackView = ANStackView(style: .v(distribution: .equalSpacing, spacing: 2))
            let imageView = UIImageView(image: smil.image)
            let label = UILabel()

            stackView.view.addArrangedSubview(imageView)
            stackView.view.addArrangedSubview(label)
            self.stackView.view.addArrangedSubview(stackView.view)
        }
    }

    // MARK: - Private Functions
    private func setupView(){
        self.prepareStackView()
    }

    private func prepareStackView(){
        self.stackView = ANStackView(style: ANStackView.Style.h(distribution: .fillEqually, spacing: 5))
        self.addSubview(self.stackView.view)

        self.stackView.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints:[NSLayoutConstraint] = [
            NSLayoutConstraint(item: self.stackView.view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.stackView.view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.stackView.view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.stackView.view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        ]

        _ = constraints.map({$0.isActive = true})
    }
}
