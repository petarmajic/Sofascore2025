//
//  LeagueMatchesViewController.swift
//  Sofascore2025App
//
//  Created by Petar Majić on 15.03.2025..
//

import UIKit
import SofaAcademic
import SnapKit


class LeagueMatchesViewController: UIViewController {

    private let leagueInfoView = LeagueInfoView()
    private let dataSource = Homework2DataSource()
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        styleViews()
        setupConstraints()
        configureViews()
    }
    
    private func addViews() {
        view.addSubview(leagueInfoView)
        view.addSubview(stackView)
    }
    
    private func styleViews() {
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
    }
    
    private func setupConstraints() {
        leagueInfoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(leagueInfoView.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureViews() {
        configureLeagueInfoView()
        configureMatchesStackView()
    }
    
    private func configureLeagueInfoView() {
        let league = dataSource.laLigaLeague()
        leagueInfoView.setCountryName(league.country?.name)
        leagueInfoView.setLeagueName(league.name)
        leagueInfoView.setLogoImage("Image")
    }
    
    private func configureMatchesStackView() {
        let events = dataSource.laLigaEvents()
        for event in events {
            let matchView = MatchesView()
            stackView.addArrangedSubview(matchView)

            let statusColor = matchView.getStatusColor(for: event.status)
            let scoreColor = matchView.getScoreColor(for: event.status)
            let timeString = matchView.getTimeString(for: event.startTimestamp)
            let homeTeamName = matchView.getHomeTeamName(for: event)
            let awayTeamName = matchView.getAwayTeamName(for: event)
            let homeScore = matchView.getHomeScore(for: event) ?? 0
            let awayScore = matchView.getAwayScore(for: event) ?? 0
            let homeTeamLogoUrl = matchView.getHomeTeamLogoUrl(for: event)
            let awayTeamLogoUrl = matchView.getAwayTeamLogoUrl(for: event)

            matchView.configure(
                withTime: timeString,
                homeTeamName: homeTeamName,
                awayTeamName: awayTeamName,
                homeScore: homeScore,
                awayScore: awayScore,
                status: event.status,
                statusColor: statusColor,
                scoreColor: scoreColor,
                homeTeamLogoUrl: homeTeamLogoUrl,
                awayTeamLogoUrl: awayTeamLogoUrl,
                startTimestamp: event.startTimestamp
            )
        }
    }

}
