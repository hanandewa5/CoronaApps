// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hospital = try? newJSONDecoder().decode(Hospital.self, from: jsonData)

import Foundation

// MARK: - Hospital
struct Hospital: Codable {
    let name, address, region : String
    let phone: String?
    let province: String
}
