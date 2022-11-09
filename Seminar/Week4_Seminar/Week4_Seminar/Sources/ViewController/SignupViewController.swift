//
//  SignupViewController.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/09.
//

import UIKit

import Moya
import SnapKit
import Then

// MARK: - SignupViewController

final class SignupViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let emailView = InputView()
    private let nameView = InputView()
    private let passwordView = InputView()
    private lazy var submitButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.layer.cornerRadius = 8
        //$0.addTarget(self, action: #selector(touchupSubmitButton), for: .touchUpInside)
    }
    
    // MARK: - Variables
    
    let titles = ["이메일", "이름", "비밀번호"]
    let placeholders = ["이메일을 입력하세요", "이름을 입력하세요", "비밀번호를 입력하세요"]
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        layout()
    }
}

// MARK: - Extensions

extension SignupViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [emailView, nameView, passwordView, submitButton].forEach {
            view.addSubview($0)
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(60)
            $0.height.equalTo(52)
        }
        
        nameView.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(emailView)
            $0.height.equalTo(52)
        }
        
        passwordView.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(nameView)
            $0.height.equalTo(52)
        }
        
        submitButton.snp.makeConstraints {
            $0.top.equalTo(passwordView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(nameView)
            $0.height.equalTo(48)
        }
    }
    
    // MARK: - General Helpers
    
    private func config() {
        emailView.config(title: titles[0], placeholder: placeholders[0])
        nameView.config(title: titles[1], placeholder: placeholders[1])
        passwordView.config(title: titles[2], placeholder: placeholders[2])
    }
    
//    private func pushToLogin() {
//        let loginVC = LoginViewController()
//        self.navigationController?.pushViewController(loginVC, animated: true)
//    }
    
    // MARK: - Action Helpers
  
    
    // MARK: - Network Helpers
    
}
