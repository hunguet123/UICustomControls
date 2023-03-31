//
//  CustomControls.swift
//  CustomControls
//
//  Created by Hà Quang Hưng on 31/03/2023.
//

import UIKit

class UICustomControls: UIControl {
    var selectedIndex = 0
    var backbroundColorControl = UIColor.blue
    var backgroundColorButton = UIColor.white
    var textColorButton = UIColor.black
    var backgroundColorCurrentButton = UIColor.red
    private var currentButton : UIButton = UIButton() {
        didSet {
            oldValue.backgroundColor = backgroundColorButton
            currentButton.backgroundColor = backgroundColorCurrentButton
        }
    }
    private var selectorStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor.blue
        return stackView
    }()

    var buttons : [UIButton] = [] {
        didSet {
            oldValue.forEach { $0.removeFromSuperview() }
            buttons.forEach {
                $0.backgroundColor = backgroundColorButton
                $0.setTitleColor(textColorButton, for: .normal)
                $0.addTarget(self, action: #selector(imageButtonTapped(_:)), for: .touchUpInside)
                selectorStackView.addArrangedSubview($0)
            }
            currentButton = buttons.first ?? UIButton()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViewHierarchy()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewHierarchy()
    }

    private func configureViewHierarchy() {
        self.addSubview(selectorStackView)
        NSLayoutConstraint.activate([
            selectorStackView.topAnchor.constraint(equalTo: topAnchor),
            selectorStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            selectorStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectorStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    @objc private func imageButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {
            preconditionFailure("The buttons and images are not parallel.")
        }
        selectedIndex = buttonIndex
        currentButton = sender
    }
    
}
