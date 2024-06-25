//
//  UserScreen.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//

import SwiftUI

struct UserScreen: View {
    //MARK: State variable
    @StateObject var viewModel = UserViewModels()
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        SearchTFBOX(searchText: $viewModel.searchText)
                        Spacer()
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(viewModel.filterUserWithNameorUserName(), id: \.id) { user in
                                NavigationLink(destination: UserDetailScreen(userDetails: user)) {
                                    HStack {
                                        Image("userprofile")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 45, height: 45)
                                            .clipShape(Circle())
                                        
                                        VStack(alignment: .leading) {
                                            Text(user.name)
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            
                                            Text("@\(user.username)")
                                                .font(.subheadline)
                                                .fontWeight(.none)
                                                .foregroundColor(.black.opacity(0.5))
                                        }
                                    }
                                    .multilineTextAlignment(.leading)
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                }
                
            }.background(
                ZStack {
                    Color(.systemTeal)
                        .edgesIgnoringSafeArea(.all)
                }
            )
            .onAppear {
                viewModel.getUsers()
            }
            .navigationBarTitle("Users From JSONPlaceholder")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserScreen()
    }
}
