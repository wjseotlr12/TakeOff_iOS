//
//  ProfileViewController.swift
//  TakeOff
//
//  Created by Jun on 2021/08/25.
//

import Foundation
import UIKit
import SnapKit
import Then

class ProfileViewController: UIViewController {
    
    let exampleText = UITextField().then {
        $0.text = "ProfileViewController"
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
