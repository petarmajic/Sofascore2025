//
//  LeagueInfoView.swift
//  Sofascore2025App
//
//  Created by Petar Majić on 15.03.2025..
//

import UIKit
import SnapKit
import SofaAcademic

class LeagueInfoView: BaseView {
    
    private let logoImageView = UIImageView()
    private let containerView = UIView()
    private let countryLabel = UILabel()
    private let arrowImageView = UIImageView()
    private let leagueLabel = UILabel()

    override func addViews() {
        addSubview(logoImageView)
        addSubview(containerView)
        
        containerView.addSubview(countryLabel)
        containerView.addSubview(arrowImageView)
        containerView.addSubview(leagueLabel)
    }

    override func styleViews() {
        countryLabel.font = UIFont(name: "Roboto-Bold", size: 14)
        countryLabel.textAlignment = .left
        countryLabel.textColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.00)
        
        leagueLabel.font = UIFont(name: "Roboto-Bold", size: 14)
        leagueLabel.textAlignment = .left
        leagueLabel.textColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.4)
    }

    override func setupConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(32)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(80)
            $0.width.equalTo(165)
            $0.height.equalTo(24)
        }

        countryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(countryLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(24)
        }
        
        leagueLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(arrowImageView.snp.trailing).offset(4)
            $0.trailing.lessThanOrEqualToSuperview()
        }
    }

    func configure(with league: League) {
        countryLabel.text = league.country?.name
        leagueLabel.text = league.name
        
        arrowImageView.image = UIImage(named: "ic_pointer_right")
        logoImageView.image = UIImage(named: "Image")
    }
}
