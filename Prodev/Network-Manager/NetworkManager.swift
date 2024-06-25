//
//  NetworkManager.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//

import Foundation
import Alamofire

class APIManager {
    
    // Shared instance of APIManager
    static let shared = APIManager()
    
    // Function to fetch users from the given URL
    func fetchUsers(completion: @escaping (Result<[UserModel], AFError>) -> Void) {
        // URL of the API endpoint to fetch users
        let url = "https://jsonplaceholder.typicode.com/users"
        // Make a network request using Alamofire to fetch users
        AF.request(url).responseDecodable(of: [UserModel].self) { response in
            // Call the completion handler with the result of the request
            debugPrint("Chore your API Result Will Be: \(response.result)")
            completion(response.result)
        }
    }
    
}
