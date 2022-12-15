//
//  DetailView.swift
//  bread and butter
//
//  Created by Arthur Sh on 13.12.2022.
//

import SwiftUI

struct DetailView: View {
    var friends: CachedUser
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBLscqrwM4DY4B5wQRdCy1GEiGkyTTT3LFAqoCIYyGsMKGg2MQ0RP1cdFiZ5pzSJY9aRg&usqp=CAU")){ image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            
            Text(friends.wrappedName)
            
            Text(friends.wrappedAddress)

        }
    }
}




