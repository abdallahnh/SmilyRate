//
//  SmilyRateView.swift
//  SmilyRate
//
//  Created by Abdallah Nehme on 09/10/2021.
//

import UIKit

public class SmilyRateView: UIView {

    // MARK: - Var
    private var stackView: UIStackView = UIStackView()
    private var smiling: [SmilModel]!
    public var value: Double! = 0 {
        didSet {
            self.update()
            didTouch(self.value)
        }
    }

    // MARK: - CallBacks
    public var didTouch: (Double)->() = {_ in}

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        self.populateDefaultData()
    }
    // MARK: - Public Functions
    public func setSmiling(smiling: [SmilModel]){
        self.smiling = smiling
        self.stackView.removeAllArrangedSubviews()
        for  smil in self.smiling {
            let stackView = ANStackView(style: .v(distribution: .fillEqually, spacing: 2)).view
            let imageView = UIImageView(image: smil.image)
            let containerView = UIView()
            let label = UILabel()
            let button = UIButton()
            button.tag = Int(smil.rateValue)
            label.font = UIFont.systemFont(ofSize: 11)
            label.numberOfLines = 2
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            label.text = smil.title

            containerView.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
            button.translatesAutoresizingMaskIntoConstraints = false

            stackView.addArrangedSubview(containerView)
            stackView.addArrangedSubview(label)

            containerView.addSubview(imageView)
            containerView.addSubview(button)

            NSLayoutConstraint(item: containerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 35).isActive = true
            NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 35).isActive = true

            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true

            NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: containerView, attribute: .width, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: containerView, attribute: .height, multiplier: 1, constant: 0).isActive = true

            self.stackView.addArrangedSubview(stackView)


            button.addTarget(self, action: #selector(buttonAction(button:)), for: .touchUpInside)
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
        guard self.smiling.count == 0 else { return }
        let sm1 = SmilModel(image: UIImage(imageLiteralResourceName: "1"), title: "Very Satisfied", selectedColor: .getRatingColor(BasedOn: self.value), rateValue: 5.0)
        let sm2 = SmilModel(image: UIImage(imageLiteralResourceName: "2"), title: "Satisfied", selectedColor: .getRatingColor(BasedOn: self.value), rateValue: 4.0 )
        let sm3 = SmilModel(image: UIImage(imageLiteralResourceName: "3"), title: "Neutral", selectedColor: .getRatingColor(BasedOn: self.value), rateValue: 3)
        let sm4 = SmilModel(image: UIImage(imageLiteralResourceName: "4"), title: "Dissatisfied", selectedColor: .getRatingColor(BasedOn: self.value), rateValue: 2)
        let sm5 = SmilModel(image: UIImage(imageLiteralResourceName: "5"), title: "Very Dissatisfied", selectedColor: .getRatingColor(BasedOn: self.value), rateValue: 1)

        self.setSmiling(smiling: [sm1, sm2, sm3, sm4, sm5])
    }
    private func update(){
        var values = [SmilModel]()
        for smil in self.smiling{
            let tag = smil.rateValue
            let selectedColor:UIColor = tag == self.value ? UIColor.getRatingColor(BasedOn: self.value): UIColor.getRatingColor(BasedOn: 0)
            values.append( SmilModel(image: smil.image.maskWithColor(color:selectedColor) ?? smil.image, title: smil.title, selectedColor:selectedColor, rateValue: smil.rateValue))
        }
        self.smiling.removeAll()
        self.setSmiling(smiling: values)
    }

    @objc private func buttonAction(button: UIButton){
        self.value = Double(button.tag)
    }

}
extension UIColor{
    class func ratingRed() -> UIColor {
        UIColor(red: 192 / 255, green: 43 / 255, blue: 30 / 255, alpha: 1.0)
    }

    class func ratingYellow() -> UIColor {
        UIColor(red: 246 / 255, green: 166 / 255, blue: 23 / 255, alpha: 1.0)
    }

    class func ratingGreen() -> UIColor {
        UIColor(red: 4 / 255, green: 113 / 255, blue: 97 / 255, alpha: 1.0)
    }

    class func ratingEmpty() -> UIColor {
        .black
    }
    class func getRatingColor(BasedOn rating: Double) -> UIColor {
        switch rating {
        case 0 :
            return ratingEmpty()
        case  1.0..<2.5:
            return ratingRed()
        case 2.5..<3.75:
            return ratingYellow()
        case 3.75...5.0:
            return ratingGreen()
        default:
            return ratingEmpty()
        }
    }
}
