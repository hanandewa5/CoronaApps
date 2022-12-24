import Foundation

// MARK: - Statistic
struct Statistic: Codable {
    let type, name: String
    let timestamp: Int
    let numbers: Numbers
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
