//
//  MatchesView.swift
//  Sofascore2025App
//
//  Created by Petar Majić on 16.03.2025..
//

import UIKit
import SnapKit
import SofaAcademic

class MatchesView: BaseView {
    private let timeLabel = UILabel()
    private let statusLabel = UILabel()
    private let dividerView = UIView()
    private let homeTeamImageView = UIImageView()
    private let awayTeamImageView = UIImageView()
    private let homeTeamLabel = UILabel()
    private let awayTeamLabel = UILabel()
    private let homeScoreLabel = UILabel()
    private let awayScoreLabel = UILabel()
    
    private let timeStatusContainer = UIView()
    private let teamsContainer = UIView()
    
    override func addViews() {
        addSubview(timeStatusContainer)
        addSubview(teamsContainer)
        addSubview(dividerView)
        
        timeStatusContainer.addSubview(timeLabel)
        timeStatusContainer.addSubview(statusLabel)
        
        teamsContainer.addSubview(homeTeamImageView)
        teamsContainer.addSubview(awayTeamImageView)
        teamsContainer.addSubview(homeTeamLabel)
        teamsContainer.addSubview(awayTeamLabel)
        teamsContainer.addSubview(homeScoreLabel)
        teamsContainer.addSubview(awayScoreLabel)
    }
    
    override func styleViews() {
        timeLabel.font = UIFont(name: "Roboto-Light", size: 12)
        timeLabel.textAlignment = .center
        statusLabel.font = UIFont(name: "Roboto-Light", size: 12)
        statusLabel.textAlignment = .center
        
        dividerView.backgroundColor = .lightGray
        
        homeTeamLabel.font = UIFont(name: "Roboto-Light", size: 14)
        homeTeamLabel.textAlignment = .left
        awayTeamLabel.font = UIFont(name: "Roboto-Light", size: 14)
        awayTeamLabel.textAlignment = .left
        homeScoreLabel.font = UIFont(name: "Roboto-Light", size: 14)
        homeScoreLabel.textAlignment = .right
        awayScoreLabel.font = UIFont(name: "Roboto-Light", size: 14)
        awayScoreLabel.textAlignment = .right
    }
    
    override func setupConstraints() {
        timeStatusContainer.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
        
        timeLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(16)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(16)
            $0.top.equalTo(timeLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(40)
            $0.left.equalTo(timeStatusContainer.snp.right).offset(16)
            $0.centerY.equalToSuperview()
        }
        
        teamsContainer.snp.makeConstraints {
            $0.left.equalTo(dividerView.snp.right).offset(16)
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            $0.centerY.equalTo(dividerView.snp.centerY)
        }
        
        homeTeamImageView.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        homeTeamLabel.snp.makeConstraints {
            $0.left.equalTo(homeTeamImageView.snp.right).offset(8)
            $0.top.equalToSuperview()
            $0.height.equalTo(16)
            $0.right.equalTo(homeScoreLabel.snp.left).offset(-8)
        }
        
        homeScoreLabel.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.right.equalToSuperview()
            $0.height.equalTo(16)
            $0.top.equalToSuperview()
        }
        
        awayTeamImageView.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.left.equalToSuperview()
            $0.top.equalTo(homeTeamImageView.snp.bottom).offset(8)
        }
        
        awayTeamLabel.snp.makeConstraints {
            $0.left.equalTo(awayTeamImageView.snp.right).offset(8)
            $0.top.equalTo(homeTeamLabel.snp.bottom).offset(8)
            $0.height.equalTo(16)
            $0.right.equalTo(awayScoreLabel.snp.left).offset(-8)
        }
        
        awayScoreLabel.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.right.equalToSuperview()
            $0.height.equalTo(16)
            $0.top.equalTo(homeScoreLabel.snp.bottom).offset(8)
        }
    }
    
    // Metoda iz predavanja
    private func loadImage(from urlString: String, into imageView: UIImageView) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
    
    func configure(with event: Event) {
        let date = Date(timeIntervalSince1970: TimeInterval(event.startTimestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeLabel.text = formatter.string(from: date)
        
        homeTeamLabel.text = event.homeTeam.name
        awayTeamLabel.text = event.awayTeam.name
        
        loadImage(from: event.homeTeam.logoUrl ?? "", into: homeTeamImageView)
        loadImage(from: event.awayTeam.logoUrl ?? "", into: awayTeamImageView)
        
        switch event.status {
        case .notStarted:
            statusLabel.text = "-"
            statusLabel.textColor = .darkGray
        case .inProgress:
            let currentTime = Date().timeIntervalSince1970
            let matchMinute = Int((currentTime - TimeInterval(event.startTimestamp)) / 60)
            statusLabel.text = "\(matchMinute)'"
            statusLabel.textColor = .red
            homeScoreLabel.textColor = .red
            awayScoreLabel.textColor = .red
            homeScoreLabel.text = "\(event.homeScore ?? 0)"
            awayScoreLabel.text = "\(event.awayScore ?? 0)"
        case .halftime:
            statusLabel.text = "HT"
            statusLabel.textColor = .darkGray
            homeScoreLabel.text = "\(event.homeScore ?? 0)"
            awayScoreLabel.text = "\(event.awayScore ?? 0)"
        case .finished:
            statusLabel.text = "FT"
            statusLabel.textColor = .darkGray
            homeScoreLabel.text = "\(event.homeScore ?? 0)"
            awayScoreLabel.text = "\(event.awayScore ?? 0)"
        }
    }
}
