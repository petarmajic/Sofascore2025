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
        
        setupViews()
        configureViews()
    }
    
    private func setupViews() {
        view.addSubview(leagueInfoView)
        leagueInfoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(56)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(leagueInfoView.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide)
        }
        
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
    }
    
    private func configureViews() {
        let league = dataSource.laLigaLeague()
        leagueInfoView.configure(with: league)
        
        let events = dataSource.laLigaEvents()
        for event in events {
            let matchView = MatchesView()
            stackView.addArrangedSubview(matchView)
            matchView.configure(with: event)
            
            matchView.snp.makeConstraints {
                $0.height.equalTo(56)
            }
        }
    }
}
