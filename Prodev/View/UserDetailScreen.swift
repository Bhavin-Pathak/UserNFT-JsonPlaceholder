//
//  UserDetailScreen.swift
//  Prodev
//
//  Created by Bhavin Pathak on 25/06/2024
//
import SwiftUI

struct UserDetailScreen: View {
    
    let userDetails: UserModel
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 20){
                Image("userprofile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .padding(.top, 30)
                Text("@\(userDetails.username)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white.opacity(0.5))
                VStack(alignment: .leading, spacing: 15){
                    HStack(alignment: .center){
                        Text("Name :-")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(userDetails.name)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    HStack(alignment: .center){
                        Text("Email address :-")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(userDetails.email)")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    HStack(alignment: .center){
                        Text("Phone number :-")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(userDetails.phone)")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    HStack(alignment: .center){
                        Text("Website :-")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(userDetails.website)")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    HStack(alignment: .center){
                        Text("Company Name :-")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(userDetails.company.name)")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .padding(.all)
                VStack(alignment: .center, spacing: 10){
                    Text("Design and developed by")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white.opacity(0.5))
                    Text("Bhavin Pathak")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding(.top)
            }
            .navigationTitle("\(userDetails.name)")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailScreen(userDetails: .init(id: 1, name: "Bhavin", username: "Godfather", email: "bupadhyay277@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "7690008729", website: "www.google.com", company: Company(name: "pathakbhavin", catchPhrase: "", bs: "")))
    }
}
