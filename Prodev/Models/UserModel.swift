//
//  UserModel.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable, Hashable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable, Hashable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable, Hashable {
    let lat: String
    let lng: String
}

// MARK: - Company
struct Company: Codable, Hashable {
    let name: String
    let catchPhrase: String
    let bs: String
}

