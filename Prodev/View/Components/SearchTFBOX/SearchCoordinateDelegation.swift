//
//  SearchCoordinateDelegation.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//

import Foundation
import SwiftUI


//MARK: Handle UISearchBar delegate methods

class Coordinator: NSObject, UISearchBarDelegate {
    
    // MARK: Hold the text entered in the search bar
    @Binding var text: String
    
    //MARK: Initializer for Coordinator class
    init(text: Binding<String>) {
        _text = text
    }
    
    //MARK: That gets called when the text in the search bar changes
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //MARK: Update the binding variable with the new text
        text = searchText
    }
}
