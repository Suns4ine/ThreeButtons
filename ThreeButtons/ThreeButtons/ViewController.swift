//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Vyacheslav Pronin on 06.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = .clear
        view.alignment = .center
        view.distribution = .fillProportionally
        view.spacing = 10
        view.sizeToFit()
        return view
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Сначала я", for: .normal)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Потом конечно же я", for: .normal)
        return button
    }()
    
    private lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.setTitle("Затем меня", for: .normal)
        button.addTarget(self, action: #selector(startSheetController), for: .touchUpInside)
        return button
    }()
    
    func setup() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        [firstButton, secondButton, thirdButton].forEach { button in
            button.titleLabel?.numberOfLines = 0
            button.semanticContentAttribute = .forceRightToLeft
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 8
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            
            
            button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
            button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
            button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpOutside)
            
            // Создание конфигурации кнопки
            var updatedConfiguration = UIButton.Configuration.plain().updated(for: button)
            
            updatedConfiguration.baseForegroundColor = .white
            
            // Установка внутренних отступов для кнопки
            updatedConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                         leading: 14,
                                                                         bottom: 10,
                                                                         trailing: 14)
            
            // Установка внутренних отступов для иконки
            updatedConfiguration.imagePadding = 8
            
            button.configuration = updatedConfiguration
            button.sizeToFit()
            stackView.addArrangedSubview(button)
        }
        setupConstraint()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    @objc
    private func startSheetController() {
        let controller = UIViewController()
        controller.view.backgroundColor = .systemGreen
        
        if let sheetController = controller.sheetPresentationController {
            sheetController.delegate = self
            sheetController.detents = [.large()]
        }
        present(controller, animated: true)
    }
    
    @objc
    private func buttonTouchDown(button: UIButton) {
        UIView.animate(withDuration: 0.3) {
            button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @objc
    private func buttonTouchUp(button: UIButton) {
        UIView.animate(withDuration: 0.3) {
            button.transform = .identity
        }
    }
}

extension ViewController: UISheetPresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {}
}
