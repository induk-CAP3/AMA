//
//  LocationDetailInfoView.swift
//  AMA
//
//  Created by DwaeWoo on 2024/04/23.
//

import UIKit
import SnapKit

final class LocationDetailInfoView: UIView {
    
    //MARK: - Declaration
    private lazy var aedPositionLabel: UILabel = {
        let label = UILabel()
        label.font = .mainTitle
        label.sizeToFit()
        label.text = "@@@@@@@@"
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var aedAddressLabel: UILabel = {
        let label = UILabel()
        label.font = .subTitle
        label.sizeToFit()
        label.text = "!!!!!"
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var directionButton: UIButton = {
        let button = UIButton()
        button.setTitle("###", for: .normal)
        button.sizeToFit()
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .modelName
        label.sizeToFit()
        label.text = "$$$$$"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var manufacturerLabel: UILabel = {
        let label = UILabel()
        label.font = .commonLabel
        label.sizeToFit()
        label.text = "%%%%%%"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var managerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .commonLabel
        label.sizeToFit()
        label.text = "^^^^^^^^"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var managerPhoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("&&&&&&&", for: .normal)
        button.sizeToFit()
        button.titleLabel?.font = .commonLabel
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LocationDetailInfoView {
    
    //MARK: - Function
    func removeSubviews() {
        
        self.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    func setUpCustomViews() {
        
        self.addSubview(aedPositionLabel)
        aedPositionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(calculatingHeight(height: 30))
            make.left.equalToSuperview().inset(calculatingWidth(width: 30))
        }
        
        self.addSubview(aedAddressLabel)
        aedAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(aedPositionLabel.snp.bottom).offset(calculatingHeight(height: 15))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 30))
        }
        
        self.addSubview(directionButton)
        directionButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(calculatingHeight(height: 20))
            make.right.equalToSuperview().inset(calculatingWidth(width: 30))
        }
    }
    
    func setUpMediumViews() {
        
        self.addSubview(directionButton)
        directionButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().inset(calculatingHeight(height: 20))
            make.right.equalToSuperview().inset(calculatingWidth(width: 30))
        }
        
        self.addSubview(productNameLabel)
        productNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(aedAddressLabel.snp.bottom).offset(calculatingHeight(height: 30))
            make.left.equalToSuperview().inset(calculatingWidth(width: 30))
        }
        
        self.addSubview(manufacturerLabel)
        manufacturerLabel.snp.remakeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(calculatingHeight(height: 15))
            make.left.equalToSuperview().inset(calculatingWidth(width: 30))
        }
        
        self.addSubview(managerNameLabel)
        managerNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(manufacturerLabel.snp.bottom).offset(calculatingHeight(height: 30))
            make.left.equalToSuperview().inset(calculatingWidth(width: 30))
        }
        
        self.addSubview(managerPhoneButton)
        managerPhoneButton.snp.remakeConstraints { make in
            make.top.equalTo(managerNameLabel.snp.bottom).offset(calculatingHeight(height: 20))
            make.left.equalToSuperview().inset(calculatingWidth(width: 30))
        }
    }
    
    func binding(info: AEDInfo) {
        aedPositionLabel.text = info.buildPlace
        aedAddressLabel.text = info.buildAddress
        directionButton.setTitle("", for: .normal)
        productNameLabel.text = info.model
        manufacturerLabel.text = info.col
        managerNameLabel.text = info.manager
        managerPhoneButton.setTitle(info.managerTel, for: .normal)
    }
}
