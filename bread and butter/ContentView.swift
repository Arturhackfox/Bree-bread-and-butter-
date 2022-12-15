//
//  ContentView.swift
//  bread and butter
//
//  Created by Arthur Sh on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var fetchedUsers: FetchedResults<CachedUser>
    
    @StateObject var friends = Friends()
    
    @State private var emptyArrayOfUsers = [Friend]()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(fetchedUsers) { member in
                    NavigationLink{
                        DetailView(friends: member)
                    } label: {
                        HStack{
                            Text(member.isActive ? "Active" : "InActive")
                                .font(.caption.bold())
                            VStack(alignment: .leading){
                                Text(member.wrappedName)
                                    .font(.caption.bold())
                                Text(member.wrappedAddress)
                                    .font(.caption.monospaced())
                                Text(member.wrappedCompany)
                                    .font(.caption)
                            }
                            
                        }
                    }
                }
                .onDelete(perform: removeR)
            }
            .task {
                if fetchedUsers.isEmpty {
                    if let retrivedData =  await addPeople(){
                        emptyArrayOfUsers = retrivedData
                    }
                    // we connect from @State array users info to CoreData classes info to display that info inside list and detail view
                    await MainActor.run {
                        for i in emptyArrayOfUsers {
                            let new = CachedUser(context: moc)
                            new.name = i.name
                            new.id = i.id
                            new.isActive = i.isActive
                            new.address = i.address
                            new.company = i.company
                            
                            try? moc.save()
                        }
                    }
                }
                    
                    
            }
            
        }
    }
    
    //Delete rows from fetchedUsers CoreData
    func removeR(at offsets: IndexSet) {
        for index in offsets {
            let users = fetchedUsers[index]
            moc.delete(users)
            try? moc.save()
        }
    }
    
    
    
  // Download json from URL and return decoded array of [Friend]
    func addPeople() async -> [Friend]?{
         let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url!)
            
             let decoded = try JSONDecoder().decode([Friend].self, from: data)
                friends.friendArray = decoded
                
                return decoded
            
        } catch {
            print("an error")
        }
        return nil
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
