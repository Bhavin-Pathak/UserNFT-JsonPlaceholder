//
//  SearchTF.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//

import Foundation
import SwiftUI


struct SearchTFBOX: UIViewRepresentable {
    
    // MARK: Hold the text entered in the search bar
    @Binding var searchText: String
    
    //MARK: Method to create an instance or object of the SearchCoordinateDelegation (Coordinator) class
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $searchText)
    }
    
    //MARK: Create the UISearchBar instance and set its delegate
    func makeUIView(context: Context) -> UISearchBar {
            // UISearchBar with zero frame (it will be resized automatically according to screen size)
            let searchBar = UISearchBar(frame: .zero)
            searchBar.delegate = context.coordinator
            
            // Customize the search bar appearance
            if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
                searchTextField.backgroundColor = UIColor.white
                searchTextField.placeholder = "Search People"
                searchTextField.layer.cornerRadius = 10
                searchTextField.layer.masksToBounds = true
            }

            // Remove the background of the search bar
            searchBar.backgroundImage = UIImage()
            searchBar.barTintColor = .clear

            return searchBar
        }
    
    //MARK: To update the UISearchBar instance with the latest data
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
    
}

