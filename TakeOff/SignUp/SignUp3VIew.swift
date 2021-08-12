//
//  SignUp3.swift
//  TakeOff
//
//  Created by Jun on 2021/08/09.
//

import UIKit
import Then
import RxSwift
import RxCocoa
import TextFieldEffects

class SignUp3View: UIViewController {
    
    let vm: SignUpViewModel
    var disposeBag = DisposeBag()
    
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    let fieldLayoutView = UIView()
    
    let emailTextField = HoshiTextField().then {
        $0.placeholder = "Email"
        $0.placeholderColor = UIColor.mainColor
        $0.placeholderFontScale = 1.0
        $0.borderActiveColor = UIColor.mainColor
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    let emailConfirmImage = UIImageView(image: UIImage(named: "check")).then {
        $0.backgroundColor = .clear
    }
    
    let emailConfirmLabel = UILabel().then {
        $0.text = "올바른 형식으로 입력하세요."
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    let nameTextField = HoshiTextField().then {
        $0.placeholder = "Nickname"
        $0.placeholderColor = UIColor.mainColor
        $0.placeholderFontScale = 1.0
        $0.borderActiveColor = UIColor.mainColor
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    let nameConfirmImage = UIImageView(image: UIImage(named: "check")).then {
        $0.backgroundColor = .clear
    }
    
    let nameConfirmLabel = UILabel().then {
        $0.text = "올바른 형식으로 입력하세요."
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    
    let pwTextField = HoshiTextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.placeholderFontScale = 1.0
        $0.placeholderColor = UIColor.mainColor
        $0.borderActiveColor = UIColor.mainColor
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
       
    }
    
    let pwConfirmImage = UIImageView(image: UIImage(named: "check")).then {
        $0.backgroundColor = .clear
    }
    
    let pwConfirmLabel = UILabel().then {
        $0.text = "올바른 형식으로 입력하세요."
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    let overlapPwTextField = HoshiTextField().then {
        $0.placeholder = "비밀번호 확인"
        $0.placeholderFontScale = 1.0
        $0.placeholderColor = UIColor.mainColor
        $0.borderActiveColor = UIColor.mainColor
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    let overlapPwConfirmImage = UIImageView(image: UIImage(named: "check")).then {
        $0.backgroundColor = .clear
    }
    
    let overlapPwConfirmLabel = UILabel().then {
        $0.text = "올바른 형식으로 입력하세요."
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    let signUpButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Sign Up", for: .normal)
        bt.backgroundColor = UIColor.enableMainColor
        bt.layer.cornerRadius = 5.0
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.setTitleColor(.white, for: .normal)
        bt.isEnabled = false
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    init(vm: SignUpViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension SignUp3View: SignUpViewAttributes {
    
    func setUI() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        safeView.addSubview(fieldLayoutView)
        fieldLayoutView.snp.makeConstraints {
            $0.centerX.equalTo(self.safeView.snp.centerX)
            $0.centerY.equalTo(self.safeView.snp.centerY)
            $0.top.left.equalTo(self.safeView).offset(20)
            $0.right.bottom.equalTo(self.safeView).offset(-20)
        }
        
        makeInfoStack()
        
    }
    
    func makeInfoStack() {
        
        let emailField = makeStackView(textfield: emailTextField, image: emailConfirmImage, label: emailConfirmLabel)
        let nameField = makeStackView(textfield: nameTextField, image: nameConfirmImage, label: nameConfirmLabel)
        let pwField = makeStackView(textfield: pwTextField, image: pwConfirmImage, label: pwConfirmLabel)
        let overlapField = makeStackView(textfield: overlapPwTextField, image: overlapPwConfirmImage, label: overlapPwConfirmLabel)
        
        let fieldStack = UIStackView(arrangedSubviews: [emailField, nameField, pwField, overlapField]).then {
            $0.axis = .vertical
            $0.spacing = 15
            $0.distribution = .fillEqually
        }
        
        
        fieldLayoutView.addSubview(fieldStack)
        fieldStack.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.7)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        fieldLayoutView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        
    }
    
    func makeStackView(textfield: UITextField, image: UIImageView, label: UILabel) -> UIView {
        
        let view = UIView()
        
        
        
        view.addSubview(textfield)
        view.addSubview(image)
        view.addSubview(label)
        
        textfield.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(textfield.snp.trailing).offset(15)
            $0.width.height.equalTo(15)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(textfield.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
            $0.height.equalTo(10)
        }
        
        
        return view
    }
    
    
    
}
