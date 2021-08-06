//
//  TrafficModelView.swift
//  TrafficLightsWithoutStoryboard
//
//  Created by Mac on 06.08.2021.
//

import UIKit

enum trafficLights {
    case off
    case green
    case yellow
    case red
}

class TrafficModelView {
    
    var alpha: Box<CGFloat?> = Box(nil)
    
    var trafficLightWorks = trafficLights.off
    
    func changeLights(startButton: UIButton,
                      greenLight: UIView,
                      yellowLight: UIView,
                      redLight: UIView) {
        
        switch trafficLightWorks {
        case .off:
            let font = UIFont.systemFont(ofSize: 24)
            let attributes = [NSAttributedString.Key.font: font]
            startButton.setAttributedTitle(NSAttributedString(
                                        string: "Next",
                                        attributes: attributes
            )
            , for: .normal)
            greenLight.alpha = 1
            trafficLightWorks = .green
        case .green:
            greenLight.alpha = 0.3
            yellowLight.alpha = 1
            trafficLightWorks = .yellow
        case .yellow:
            yellowLight.alpha = 0.3
            redLight.alpha = 1
            trafficLightWorks = .red
        case .red:
            redLight.alpha = 0.3
            greenLight.alpha = 1
            trafficLightWorks = .green
        }
    }
}
