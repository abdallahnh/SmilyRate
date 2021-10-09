//
//  SmilyRateView.swift
//  SmilyRate
//
//  Created by Abdallah Nehme on 09/10/2021.
//

import UIKit

public class SmilyRateView: UIView {

    // MARK: - Var
    private var stackView: UIStackView!
    private var smiling: [SmilModel]!

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Public Functions
    public func setSmiling(smiling: [SmilModel]){
        for smil in smiling {
            let stackView = ANStackView(style: .v(distribution: .equalSpacing, spacing: 2)).view
            let imageView = UIImageView(image: smil.image)
            let label = UILabel()

            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(label)
            self.stackView.addArrangedSubview(stackView)
        }
    }

    // MARK: - Private Functions
    private func setupView(){
        self.prepareStackView()
    }

    private func prepareStackView(){
        self.stackView = ANStackView(style: ANStackView.Style.h(distribution: .fillEqually, spacing: 5)).view
        self.addSubview(self.stackView)

        self.stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints:[NSLayoutConstraint] = [
            NSLayoutConstraint(item: self.stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.stackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.stackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.stackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        ]

        _ = constraints.map({$0.isActive = true})
    }
}
