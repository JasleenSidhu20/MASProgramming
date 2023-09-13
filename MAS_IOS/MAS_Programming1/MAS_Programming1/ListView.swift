//
//  ListView.swift
//  MAS_Programming1
//
//  Created by Jasleen Sidhu on 9/12/23.
//

import SwiftUI

//struct Course: Hashable, Codable{
//    let message: String
//    let status: String
//}

//struct Joke: Codable {
//    let value: String
//}


struct ListView: View {
    @State private var dogBreeds: [String] = []
        
        @State private var showError = false
        
        var body: some View {
           
                VStack {
                    
                        NavigationView {
                            List(dogBreeds, id: \.self) { dogBreed in
                                NavigationLink {
                                    DogView(dogBreed: dogBreed)
                                } label: {
                                    Text(dogBreed.capitalized)
                                }
                                
                            }.navigationTitle("Dog Breeds!")
                            
                        }.task {
                            await getDogBreeds()
                        }.alert("Error", isPresented: $showError) {
                            Button("Ok") {
                                
                            }
                        } message: {
                            Text("There was an error fetching the dogs.  Sorry :(")
                        }
                        .foregroundColor(.purple)
                        .bold()
                        //            .background(.purple)
                    }
                
            
            
}
    
    func getDogBreeds() async {
            do {
                let responseJson: BreedResponse = try await getData(urlString: "https://dog.ceo/api/breeds/list/all")
                dogBreeds = responseJson.message.keys.map { $0 }.sorted()
            } catch {
                print(error)
                showError = true
            }
        }
    }
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
