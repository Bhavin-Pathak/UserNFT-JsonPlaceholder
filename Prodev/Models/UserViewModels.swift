//
//  UserViewModels.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//

import Foundation
import Combine
import SwiftUI

class UserViewModels: ObservableObject {
    
    //MARK: Published properties to update the UI when their values change
    @Published var users: [UserModel] = [] // Array to hold the list of users
    @Published var selectedUser: Set<UserModel> = [] // Set to hold selected users
    @Published var searchText: String = "" // String to hold search text
    @Published var isLoading: Bool = false // Boolean to track loading state
    
    //Fetch users when the ViewModel is created
    init() {
        getUsers()
    }
    
    // Method to fetch users from the API
    func getUsers() {
        // Set isLoading to true before fetching data
        isLoading = true
        // Call the fetchUsers method from APIManager
        APIManager.shared.fetchUsers { [weak self] result in
            // Set isLoading to false after fetching data
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            switch result {
                // If fetching users is successful
            case .success(let user):
                // Update the users property on the main thread
                DispatchQueue.main.async {
                    self?.users = user
                    debugPrint("Chore Your Success Result is \(user)")
                }
                // If fetching users fails
            case .failure(let error):
                // Print the error to the console
                print("Error fetching Users: \(error)")
            }
        }
    }
    
    // Method to filter users by name or username based on searchText
    func filterUserWithNameorUserName() -> [UserModel] {
        // If searchText is empty, return all users
        if searchText.isEmpty {
            return users
        } else {
            // Otherwise, filter users whose name or username contains searchText
            return users.filter {
                $0.name.lowercased().contains(searchText.lowercased()) || $0.username.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    //MARK: Select All Users
    func toggleSelectAllUsers() {
        if selectedUser.count == users.count {
            selectedUser.removeAll()
        } else {
            selectedUser = Set(users)
        }
    }
    
}
