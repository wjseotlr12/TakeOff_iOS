//
//  HomeViewController.swift
//  TakeOff
//
//  Created by Jun on 2021/08/23.
//

import Foundation
import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    let exampleText = UITextField().then {
        $0.text = "HomeViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(exampleText)
        exampleText.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
