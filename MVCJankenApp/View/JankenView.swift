//
//  JankenView.swift
//  MVCJankenApp
//
//  Created by 大塚周 on 2020/12/18.
//

import UIKit
import SnapKit
final class JankenView: UIView {
    
    var jankenLabel: UILabel = {
        var label = UILabel()
        label.text = "✊"
        label.font = UIFont.systemFont(ofSize: 100)
        label.textAlignment = .center
        label.backgroundColor = .red
        return label
    }()
    
    let jankenButton: UIButton = {
        let button = UIButton()
        button.setTitle("ジャンケンする", for: .normal)
        button.backgroundColor = .cyan
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(jankenLabel, jankenButton)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        jankenLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        jankenButton.snp.makeConstraints {
            $0.centerY.equalTo(jankenLabel.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
        }
    }
}
