//
//  ContentView.swift
//  MAS_Programming1
//
//  Created by Jasleen Sidhu on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//                .padding()
            
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous <#T##CGSize#>)
            
        }
        .ignoresSafeArea()
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
