//
//  PopularDestinationsView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/16.
//

import SwiftUI
import MapKit

struct PopularDestinationsView:View {
    
    let destinations: [Destination] = [
        .init(name: "Caoling Historic Trail", city: "Yilan", imageName: "Caoling Historic Trail, Yilan County",latitude: 24.990080, longitude:  121.925373),
        .init(name: "Taoyuan Valley", city: "Yilan", imageName: "Taoyuan Valley, Yilan",latitude: 24.952203,longitude: 121.909679),
        .init(name: "Chishang Township", city: "Taitung", imageName: "Chishang Township, Taitung County",latitude: 23.124992, longitude: 121.215148)
        
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
                        NavigationLink(
                            destination: PopularDestinationDetial(destination: destination),
                            label: {
                                PopularDestinationTile(destination: destination)
                                .frame(width: 150, height: 170)
                                .asTile()
                                .padding(.bottom)
                            })
                       
                         
                        }
                          
                   
                }.padding(.horizontal)
            } 
            
        }

    }
}

struct PopularDestinationDetial:View {
    let destination: Destination
    
    @State var region : MKCoordinateRegion
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude:  destination.longitude), span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
   
    var body: some View{
        ScrollView{
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width:UIScreen.main.bounds.size.width ,height: 300)
                .clipped()
            VStack(alignment: .leading, spacing: 8){
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.top, 4)
                Text(destination.city)
                HStack{
                    ForEach(0..<5, id: \.self){ num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            .font(.system(size:16))
                    }
                }.padding(.top, 2)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top, 4)
                
                HStack{Spacer()}
            }
            .padding(.horizontal)
            
            HStack(){
                Text("Location:")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.top, 4)
                Spacer()
            }
            .padding(.horizontal)
            
            Map(coordinateRegion: $region)
                .frame(height: 300)
            
            
            
            
           
        }.navigationBarTitle(destination.name, displayMode: .inline)
        
    }
    
   
    
}


struct PopularDestinationTile:View {
    let destination: Destination
    var body: some View{
        VStack(alignment: .leading){
                Image(destination.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 120)
                Text(destination.name)
                  .font(.system(size: 14, weight: .medium))
                    .padding(.horizontal, 4)
                    .foregroundColor(.black)
                Text(destination.city)
                  .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 4)
                Spacer()
                  
            }
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PopularDestinationDetial(destination: .init(name: "Caoling Historic Trail", city: "Yilan", imageName: "Caoling Historic Trail, Yilan County",latitude: 24.990080, longitude:  121.925373))
        }
    
        DiscoverView()
    }
}
