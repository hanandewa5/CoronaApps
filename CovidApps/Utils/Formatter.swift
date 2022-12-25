//
//  Formatter.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import Foundation

func decimalFormat(n: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = "."
    return String((formatter.string(for: n) ?? "").prefix(9))
}

func unixToStringDate(unix: Double) -> String {
    let date = Date(timeIntervalSince1970: (unix / 1000))
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.none //Set time style
    dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    dateFormatter.timeZone = .current
    let localDate = dateFormatter.string(from: date)
    return localDate
}
