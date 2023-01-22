//
//  ViewController.swift
//  BaselineAnchors
//
//  Created by Shah Md Imran Hossain on 22/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        let smallLabel = makeLabel(withText: "small", size: 12)
        let largeLabel = makeLabel(withText: "large", size: 32)
        
        view.addSubview(smallLabel)
        view.addSubview(largeLabel)
        
        // small label
        NSLayoutConstraint.activate([
            smallLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            smallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
        
        // large label
        NSLayoutConstraint.activate([
            // largeLabel top anchor equal with smallLable top anchor - required for top alingment
//            largeLabel.topAnchor.constraint(equalTo: smallLabel.topAnchor),
            // largeLabel centerYAnchor equal with smallLable centerYAnchor - required for middle alignment
//            largeLabel.centerYAnchor.constraint(equalTo: smallLabel.centerYAnchor),
            // required for bottom alignment
            largeLabel.firstBaselineAnchor.constraint(equalTo: smallLabel.firstBaselineAnchor),
            largeLabel.leadingAnchor.constraint(equalTo: smallLabel.trailingAnchor, constant: 8)
        ])
    }
}

// MARK: - Factory label
extension ViewController {
    func makeLabel(withText text: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: size)
        label.text = text
        
        return label
    }
}
