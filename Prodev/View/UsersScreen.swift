//
//  ContentView.swift
//  Prodev
//
//  Created by MacBookPro on 04/04/1946 Saka.
//

import SwiftUI

struct UsersScreen: View {
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(.systemIndigo)
                VStack{
                    Image(systemName: "person")
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Gift an NFT")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: HStack{
                Button("Select all") {
                    //MARK: 
                }
                .buttonStyle(.plain)
                .foregroundColor(.white)
            })
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersScreen()
    }
}
