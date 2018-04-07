//
//  SecondViewController.swift
//  PickerViewApp
//
//  Created by Evgeniy Ryshkov on 07.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var year: String?
    
    //MARK: - UI Views Setup
    var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var backButton: UIButton = {
        let newButton = UIButton(frame: .zero)
        newButton.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.4862745098, blue: 0.9647058824, alpha: 1)
        newButton.contentEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        newButton.setTitle("Back", for: .normal)
        newButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        newButton.layer.borderWidth = 1
        newButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        newButton.layer.cornerRadius = 5
        newButton.clipsToBounds = true
        newButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        newButton.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .highlighted)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return newButton
    }()
    
    var yearLabel: UILabel = {
        let newLabel = UILabel(frame: .zero)
        newLabel.backgroundColor = .clear
        newLabel.text = ""
        newLabel.textAlignment = .center
        newLabel.numberOfLines = 1
        newLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        return newLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwYear = year {
            yearLabel.text = "The \(unwYear) is \(unwYear.isLeapYear() ? "leap-year" : "not leap-year")"
        }
        
        layoutSetup()
    }
    
    func layoutSetup(){
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(yearLabel)
        mainStackView.addArrangedSubview(backButton)
        
        var constraints = [NSLayoutConstraint]()
        
        //Stack View Setup
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        
        //Label View Setup
        constraints.append(NSLayoutConstraint(item: yearLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .width, multiplier: 0.9, constant: 0))
        
        //Button View Setup
        constraints.append(NSLayoutConstraint(item: backButton, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: yearLabel, attribute: .width, multiplier: 0.5, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}















