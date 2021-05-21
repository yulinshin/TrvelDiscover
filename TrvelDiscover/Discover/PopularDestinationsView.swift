//
//  PopularDestinationsView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/16.
//

import SwiftUI

struct PopularDestinationsView:View {
    
    let destinations: [Destination] = [
        .init(name: "Caoling Historic Trail", city: "Yilan", imageName: "Caoling Historic Trail, Yilan County"),
        .init(name: "Taoyuan Valley", city: "Yilan", imageName: "Taoyuan Valley, Yilan"),
        .init(name: "Chishang Township", city: "Taitung", imageName: "Chishang Township, Taitung County")
        
    ]
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular destionations")
                .font(.system(size: 14, weight: .medium))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .medium))
            
        }.padding(.horizontal)
        .padding(.top)
            
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(destinations, id: \.self){ destination in
                            
                        VStack(alignment: .leading){
                                Image(destination.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 120)
                                Text(destination.name)
                                  .font(.system(size: 14, weight: .medium))
                                    .padding(.horizontal, 4)
                                Text(destination.city)
                                  .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 4)
                                Spacer()
                                  
                            }
                        .frame(width: 150, height: 170)
                        .asTile()
                        .padding(.bottom)
                         
                        }
                          
                   
                }.padding(.horizontal)
            } 
            
        }

    }
}


struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsView()
        DiscoverView()
    }
}
