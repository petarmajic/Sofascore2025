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
    
    private let teamsContainer = UIView()
    
    override func addViews() {
        addSubview(timeLabel)
        addSubview(statusLabel)
        addSubview(teamsContainer)
        addSubview(dividerView)
        
        teamsContainer.addSubview(homeTeamImageView)
        teamsContainer.addSubview(awayTeamImageView)
        teamsContainer.addSubview(homeTeamLabel)
        teamsContainer.addSubview(awayTeamLabel)
        teamsContainer.addSubview(homeScoreLabel)
        teamsContainer.addSubview(awayScoreLabel)
    }
    
    override func styleViews() {
        timeLabel.font = UIFont.robotoLight12
        timeLabel.textAlignment = .center
        statusLabel.font = UIFont.robotoLight12
        statusLabel.textAlignment = .center
        
        dividerView.backgroundColor = .lightGray
        
        homeTeamLabel.font = UIFont.robotoLight14
        homeTeamLabel.textAlignment = .left
        awayTeamLabel.font = UIFont.robotoLight14
        awayTeamLabel.textAlignment = .left
        homeScoreLabel.font = UIFont.robotoLight14
        homeScoreLabel.textAlignment = .right
        awayScoreLabel.font = UIFont.robotoLight14
        awayScoreLabel.textAlignment = .right
    }
    
    override func setupConstraints() {
        timeLabel.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(4)
        }

        statusLabel.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(4)
        }

        dividerView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.top.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(4)
        }

        teamsContainer.snp.makeConstraints {
            $0.leading.equalTo(dividerView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }

        homeTeamImageView.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        homeTeamLabel.snp.makeConstraints {
            $0.leading.equalTo(homeTeamImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview()
        }

        homeScoreLabel.snp.makeConstraints {
            $0.top.equalTo(homeTeamLabel.snp.top)
            $0.trailing.equalToSuperview().inset(4)
        }
        
        awayTeamImageView.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.leading.equalToSuperview()
            $0.top.equalTo(homeTeamImageView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
        }
        
        awayTeamLabel.snp.makeConstraints {
            $0.leading.equalTo(awayTeamImageView.snp.trailing).offset(8)
            $0.top.equalTo(homeTeamLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
        }

        awayScoreLabel.snp.makeConstraints {
            $0.top.equalTo(awayTeamLabel.snp.top)
            $0.trailing.equalToSuperview().inset(4)
        }
        
       
    }
    
    // Metoda iz predavanja
    public func loadImage(from urlString: String, into imageView: UIImageView) {
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
    
    func configure(
         withTime time: String,
         homeTeamName: String,
         awayTeamName: String,
         homeScore: Int,
         awayScore: Int,
         status: EventStatus,
         statusColor: UIColor,
         scoreColor: UIColor,
         homeTeamLogoUrl: String,
         awayTeamLogoUrl: String,
         startTimestamp: Int
     ) {
         timeLabel.text = time
         
         homeTeamLabel.text = homeTeamName
         awayTeamLabel.text = awayTeamName

         if status == .notStarted {
                homeScoreLabel.text = ""
                awayScoreLabel.text = ""
            } else {
                homeScoreLabel.text = "\(homeScore)"
                awayScoreLabel.text = "\(awayScore)"
            }

         homeScoreLabel.textColor = scoreColor
         awayScoreLabel.textColor = scoreColor

         statusLabel.text = getStatusDescription(for: status, startTimestamp: startTimestamp)
         statusLabel.textColor = statusColor
          
         loadImage(from: homeTeamLogoUrl, into: homeTeamImageView)
         loadImage(from: awayTeamLogoUrl, into: awayTeamImageView)
     }
    
    

}
