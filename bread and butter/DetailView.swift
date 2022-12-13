//
//  DetailView.swift
//  bread and butter
//
//  Created by Arthur Sh on 13.12.2022.
//

import SwiftUI

struct DetailView: View {
    var friends: Friend
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBLscqrwM4DY4B5wQRdCy1GEiGkyTTT3LFAqoCIYyGsMKGg2MQ0RP1cdFiZ5pzSJY9aRg&usqp=CAU")){ image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            
            Text(friends.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(friends: Friend(id: "sd", isActive: false, name: "test", age: 12, company: "sadad", email: "sdsdfsd", address: "sdfds", about: "sdfsf", registered: "sdfsdf", tags: [" ", "sdfsd"], friends: [Friendss(id: "asd", name: "test")]))
    }
}
