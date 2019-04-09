//
//  RootViewController.swift
//  CustomUISegmeentedControll
//
//  Created by Alex Nagy on 09/04/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import TinyConstraints

class RootViewController: UIViewController {
    
    let items = ["Black", "Red", "Purple"]
    
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        control.layer.borderWidth = 1
        control.layer.masksToBounds = true
        control.layer.borderColor = UIColor.white.cgColor
        control.tintColor = UIColor.white
        control.backgroundColor = UIColor.black
        control.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)], for: .normal)
        control.addTarget(self, action: #selector(handleSegmentedControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    @objc fileprivate func handleSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .black
        case 1:
            view.backgroundColor = .red
        case 2:
            view.backgroundColor = .purple
        default:
            view.backgroundColor = .black
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    fileprivate func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(segmentedControl)
        
        segmentedControl.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12), usingSafeArea: true)
        segmentedControl.height(30)
    }

}

