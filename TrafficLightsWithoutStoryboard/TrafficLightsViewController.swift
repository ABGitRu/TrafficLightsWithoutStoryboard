//
//  TrafficLightsViewController.swift
//  TrafficLightsWithoutStoryboard
//
//  Created by Mac on 04.08.2021.
//

import UIKit


class TrafficLightsViewController: UIViewController {
    
    private var viewModel = TrafficModelView()
    
    private var redLight: UIView!
    private var yellowLight: UIView!
    private var greenLight: UIView!
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        let font = UIFont.systemFont(ofSize: 24)
        let attributes = [NSAttributedString.Key.font: font]
        button.setAttributedTitle(NSAttributedString(
                                    string: "Start",
                                    attributes: attributes
        )
        , for: .normal)
        button.addTarget(self,
                         action: #selector(startButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        bindAlpha()
    }
    
    @objc func startButtonTapped() {
        viewModel.changeLights(startButton: startButton,
                               greenLight: greenLight,
                               yellowLight: yellowLight,
                               redLight: redLight)
    }
    
    private func bindAlpha() {
        viewModel.alpha.bind { [unowned self] in
            guard let float = $0 else { return }
            self.redLight.alpha = float
            self.yellowLight.alpha = float
            self.greenLight.alpha = float
        }
        viewModel.alpha.value = 0.3
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        redLight = setupLight(color: .red)
        yellowLight = setupLight(color: .yellow)
        greenLight = setupLight(color: .green)
        view.addSubview(redLight)
        view.addSubview(yellowLight)
        view.addSubview(greenLight)
        view.addSubview(startButton)
    }
    
    private func setupLight(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.borderWidth = 5
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.backgroundColor = color
        return view
    }
    
    private func setupConstraints() {
        
        let constraints = [
            redLight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redLight.widthAnchor.constraint(equalToConstant: 100),
            redLight.heightAnchor.constraint(equalToConstant: 100),
            
            yellowLight.topAnchor.constraint(equalTo: redLight.bottomAnchor, constant: 20),
            yellowLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowLight.widthAnchor.constraint(equalTo: redLight.widthAnchor),
            yellowLight.heightAnchor.constraint(equalTo: redLight.heightAnchor),
            
            greenLight.topAnchor.constraint(equalTo: yellowLight.bottomAnchor, constant: 20),
            greenLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenLight.widthAnchor.constraint(equalTo: redLight.widthAnchor),
            greenLight.heightAnchor.constraint(equalTo: redLight.heightAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalTo: redLight.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}

