//
//  ContentView.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//

import SwiftUI

struct UsersScreen: View {
    //MARK: Stateobject form viewmodel
    @StateObject private var viewModel = UserViewModels()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading users...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(1.5, anchor: .center)
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Gift an NFT")
                                .font(.largeTitle)
                                .bold()
                                .padding(.leading)
                                .foregroundColor(.white)
                            SearchTFBOX(searchText: $viewModel.searchText)
                            VStack(alignment: .leading, spacing: 20) {
                                ForEach(viewModel.filterUserWithNameorUserName(), id: \.id) { user in
                                    Button {
                                        if viewModel.selectedUser.contains(user) {
                                            viewModel.selectedUser.remove(user)
                                        } else {
                                            viewModel.selectedUser.insert(user)
                                        }
                                    } label: {
                                        HStack {
                                            Image("userprofile")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 45, height: 45)
                                                .clipShape(Circle())
                                            
                                            VStack(alignment: .leading) {
                                                Text(user.name)
                                                    .font(Font.custom("Inter", size: 17).weight(.bold))
                                                    .foregroundColor(.black)
                                                
                                                Text("@\(user.username)")
                                                    .font(Font.custom("Inter", size: 15))
                                                    .foregroundColor(.gray)
                                            }
                                            
                                            Spacer()
                                            Image(systemName: viewModel.selectedUser.contains(user) ? "checkmark.circle.fill" : "circle")
                                                .resizable()
                                                .frame(width: 22, height: 22)
                                                .foregroundColor(viewModel.selectedUser.contains(user) ? .blue : .gray)
                                            
                                        }
                                        .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            .padding([.leading, .trailing])
                            HStack {
                                Button {
                                    printSelectedContacts()
                                } label: {
                                    Text("Send Gift  \(Image(systemName: "chevron.right.circle"))")
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .padding(10)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Button {
                                    // Add your share app action here
                                } label: {
                                    Text("Share App  \(Image(systemName: "paperplane"))")
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .padding(10)
                                        .cornerRadius(10)
                                        .foregroundColor(.blue)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding([.top, .leading, .trailing], 35)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getUsers()
            }
            .background(
                ZStack {
                    Color.indigo
                        .edgesIgnoringSafeArea(.top)
                }
                    .frame(width: UIScreen.main.bounds.width, height: 250) // Adjust the height as needed
                    .padding(.bottom, 500) // Offset the title to align with the navigation bar
            )
            .foregroundColor(.white)
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button("Select All") {
                viewModel.toggleSelectAllUsers()
            }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.white)
            )
        }
    }
    
    private func printSelectedContacts() {
        for selectedUsers in viewModel.selectedUser {
            print("Selected Users: Name is \(selectedUsers.name) and Username is \(selectedUsers.username)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersScreen()
    }
}
