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
        //UISearchBar with zero frame (it will be resized automatically according to screen size)
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    //MARK: To update the UISearchBar instance with the latest data
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
    
}

