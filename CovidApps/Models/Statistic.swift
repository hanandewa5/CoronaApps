// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let statistics = try? newJSONDecoder().decode(Statistics.self, from: jsonData)

import Foundation

// MARK: - Statistics
struct Statistic: Codable {
    let type, name: String
    let timestamp: Double
    let numbers: Numbers?
    let regions: [Region]
}

// MARK: - Numbers
struct Numbers: Codable {
    let infected, recovered, fatal: Int
}

// MARK: - Region
struct Region: Codable {
    let type: TypeEnum
    let name: String
    let numbers: Numbers
}

enum TypeEnum: String, Codable {
    case province = "province"
}
