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
        self.setupView()
        self.populateDefaultData()
    }
    // MARK: - Public Functions
    public func setSmiling(smiling: [SmilModel]){
        for smil in smiling {
            let stackView = ANStackView(style: .v(distribution: .fillEqually, spacing: 2)).view
            let imageView = UIImageView(image: smil.image)
            let containerView = UIView()

            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            label.numberOfLines = 2
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            label.text = smil.title

            containerView.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false

            stackView.addArrangedSubview(containerView)
            stackView.addArrangedSubview(label)

            containerView.addSubview(imageView)

            NSLayoutConstraint(item: containerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 35).isActive = true
            NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 35).isActive = true

            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true

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
    private func populateDefaultData(){
        let sm1 = SmilModel(image: UIImage(imageLiteralResourceName: "1"), title: "Very Satisfied")
        let sm2 = SmilModel(image: UIImage(imageLiteralResourceName: "2"), title: "Satisfied")
        let sm3 = SmilModel(image: UIImage(imageLiteralResourceName: "3"), title: "Neutral")
        let sm4 = SmilModel(image: UIImage(imageLiteralResourceName: "4"), title: "Dissatisfied")
        let sm5 = SmilModel(image: UIImage(imageLiteralResourceName: "5"), title: "Very Dissatisfied")

        self.setSmiling(smiling: [sm1, sm2, sm3, sm4, sm5])
    }
}
