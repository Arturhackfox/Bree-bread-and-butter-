//
//  ContentView.swift
//  bread and butter
//
//  Created by Arthur Sh on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var friends = Friends()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(friends.friendArray) { member in
                    NavigationLink{
                        DetailView(friends: member)
                    } label: {
                        HStack{
                            Text(member.isActive ? "Online" : "Offline")
                                .font(.caption.bold())
                            VStack(alignment: .leading){
                                Text(member.name)
                                    .font(.caption.bold())
                                Text(member.address)
                                    .font(.caption.monospaced())
                                Text(member.company)
                                    .font(.caption)
                            }
                            
                        }
                    }
                }
            }
            .toolbar{
                Button{
                    Task{
                        await addPeople()
                    }
                } label: {
                    Image(systemName: "plus")
                }
            }
            
        }
    }
    
    func addPeople() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Wrong url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoded = try? JSONDecoder().decode([Friend].self, from: data) {
                friends.friendArray = decoded
            }
        } catch {
            print("an error")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
