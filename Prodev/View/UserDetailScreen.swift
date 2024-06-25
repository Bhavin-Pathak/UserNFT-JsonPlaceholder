//
//  UserDetailScreen.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//
import SwiftUI

struct UserDetailScreen: View {
    
    @StateObject var userDetails = UserViewModels()
    
    var body: some View {
        NavigationView {
            VStack{
                Text("PPPPPPPPPPPP")
            }
        }
        .onAppear{
            userDetails.getUsers()
        }
    }
}

struct UserDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailScreen()
    }
}
