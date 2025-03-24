//
//  MatchesViewExtensions.swift
//  Sofascore2025App
//
//  Created by Petar Majić on 24.03.2025..
//

import UIKit
import SofaAcademic
import SnapKit

extension MatchesView {
    
    func getHomeTeamName(for event: Event) -> String {
        return event.homeTeam.name
    }
    
    func getAwayTeamName(for event: Event) -> String {
        return event.awayTeam.name
    }
    
    func getHomeScore(for event: Event) -> Int? {
        if event.status == .notStarted {
            return nil
        }
        return event.homeScore ?? 0
    }

    func getAwayScore(for event: Event) -> Int? {
        if event.status == .notStarted {
            return nil
        }
        return event.awayScore ?? 0
    }

    func getHomeTeamLogoUrl(for event: Event) -> String {
        return event.homeTeam.logoUrl ?? ""
    }
    
    func getAwayTeamLogoUrl(for event: Event) -> String {
        return event.awayTeam.logoUrl ?? ""
    }
    
    func getStatusDescription(for event: EventStatus, startTimestamp: Int) -> String {
        switch event {
        case .notStarted:
            return "-"
        case .inProgress:
            let currentTime = Date().timeIntervalSince1970
            let matchMinute = Int((currentTime - TimeInterval(startTimestamp)) / 60)
            return "\(matchMinute)'"
        case .halftime:
            return "HT"
        case .finished:
            return "FT"
        }
    }

    func getStatusColor(for event: EventStatus) -> UIColor {
        return event == .inProgress ? .red : .black
    }
    
    func getScoreColor(for status: EventStatus) -> UIColor {
        return status == .inProgress ? .red : .black
    }
    
    func getTimeString(for startTimestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(startTimestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
