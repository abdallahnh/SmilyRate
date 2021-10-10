//
//  SmilyRateView.swift
//  SmilyRate
//
//  Created by Abdallah Nehme on 09/10/2021.
//

import UIKit
@IBDesignable
public class SmilyRateView: UIView {

    // MARK: - Var
    private var stackView: UIStackView = UIStackView()
    private var smiling = [SmilModel]()
    private var smilingImages = [UIImage]()
    private var _selectedColor: UIColor = UIColor(rgb: 0x076e5d)
    private var _unSelectedColor: UIColor = UIColor(rgb: 0x076e5d).withAlphaComponent(0.3)

    public var value: Double! = 0 {
        didSet {
            self.update()
            didTouch(self.value)
        }
    }
    // MARK: - Properties
    @IBInspectable
    public var selectedColor: UIColor = UIColor(rgb: 0x076e5d){
        didSet{
            self._selectedColor = self.selectedColor
        }
    }
    @IBInspectable
    public var unSelectedColor: UIColor = UIColor(rgb: 0x076e5d).withAlphaComponent(0.3){
        didSet{
            self._unSelectedColor = self.unSelectedColor
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
            self.smilingImages.append(smil.image)
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
        self.smilingImages = [UIImage(imageLiteralResourceName: "1"),
                        UIImage(imageLiteralResourceName: "2"),
                        UIImage(imageLiteralResourceName: "3"),
                        UIImage(imageLiteralResourceName: "4"),
                        UIImage(imageLiteralResourceName: "5")]
        let sm1 = SmilModel(image: self.getImage(BasedOn: self.value, andImage: self.smilingImages[0]),
                            title: "Very Satisfied",
                            selectedColor: self.getRatingColor(BasedOn: self.value), rateValue: 5.0)
        let sm2 = SmilModel(image:  self.getImage(BasedOn: self.value, andImage:  self.smilingImages[1]),
                            title: "Satisfied",
                            selectedColor: self.getRatingColor(BasedOn: self.value), rateValue: 4.0 )
        let sm3 = SmilModel(image:  self.getImage(BasedOn: self.value, andImage:  self.smilingImages[2]),
                            title: "Neutral",
                            selectedColor: self.getRatingColor(BasedOn: self.value), rateValue: 3.0)
        let sm4 = SmilModel(image:  self.getImage(BasedOn: self.value, andImage:  self.smilingImages[3]),
                            title: "Dissatisfied",
                            selectedColor: self.getRatingColor(BasedOn: self.value), rateValue: 2.0)
        let sm5 = SmilModel(image:  self.getImage(BasedOn: self.value, andImage:  self.smilingImages[4]),
                            title: "Very Dissatisfied",
                            selectedColor: self.getRatingColor(BasedOn: self.value), rateValue: 1.0)

        self.setSmiling(smiling: [sm1, sm2, sm3, sm4, sm5])
    }
    private func update(){
        var values = [SmilModel]()
        for (index,smil) in self.smiling.enumerated(){
            let image = self.smilingImages[index]
            values.append( SmilModel(image: self.getImage(BasedOn: smil.rateValue, andImage: image), title: smil.title, selectedColor:self.getRatingColor(BasedOn: smil.rateValue), rateValue: smil.rateValue))
        }
        self.smiling.removeAll()
        self.setSmiling(smiling: values)
    }
    private func getRatingColor(BasedOn value: Double) -> UIColor {
        if value == self.value {
            return self._selectedColor
        }
        else{
            return self._unSelectedColor
        }
    }
    private func getImage(BasedOn value: Double, andImage image: UIImage) -> UIImage {
        guard self.value > 0  else { return image}
        if value == self.value {
            return image.maskWithColor(color: self._selectedColor) ?? image
        }
        else{
            return  image.maskWithColor(color: self.unSelectedColor)  ?? image
        }
    }
   
    @objc private func buttonAction(button: UIButton){
        self.value = Double(button.tag)
    }

}
