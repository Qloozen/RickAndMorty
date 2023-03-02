//
//  DateHelper.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 02/03/2023.
//

import Foundation

final class DateHelper {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()
    
    public static func formatDate(_ date: String) -> String? {
        guard let dateObject = Self.dateFormatter.date(from: date) else {
            return nil
        }
        let displayString = Self.shortDateFormatter.string(from: dateObject)
        return displayString
    }
}
