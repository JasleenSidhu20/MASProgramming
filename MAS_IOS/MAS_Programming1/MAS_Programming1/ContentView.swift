//
//  ContentView.swift
//  MAS_Programming1
//
//  Created by Jasleen Sidhu on 9/12/23.
//

import SwiftUI

import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        if userIsLoggedIn {
            ListView()
        } else {
            content
        }
    }
    
    var content : some View {
        ZStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//                .padding()
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .purple] , startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1200, height: 450)
                .rotationEffect(.degrees(15))
                .offset(y : -350)
            
//            Color.black
//            RoundedRectangle(cornerRadius: 30, style: .continuous)
//                .foregroundStyle(.linearGradient(colors: [.purple, .red] , startPoint: .topLeading, endPoint: .bottomTrailing))
//                .frame(width: 1000, height: 400)
//                .rotationEffect(.degrees(15))
//                .offset(y : -350)
            
            VStack(spacing: 20){
                Text("Login for Dogs!")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -10, y:-100)
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                                 
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottomTrailing))
                            )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
                
                Button {
                    login()
                } label: {
                    Text("Already have an account/Login")
                        .bold()
                        .foregroundColor(.white)
                
                }
                .padding(.top)
                .offset(y: 110)
                

                
            }
            .frame(width: 350)
//            .onAppear {
//                Auth.auth().addStateDidChangeListener{auth, user in
//                    if user != nil {
//                       userIsLoggedIn = true
//                    }
                    
                    
//                }
//            }
                   
        }
        .ignoresSafeArea()
    }
    
    func login()
    {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil{
                print(error!.localizedDescription)
            } else {
                userIsLoggedIn = true
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
