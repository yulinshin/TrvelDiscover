//
//  ContentView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/8.
//

import SwiftUI

struct DiscoverView: View {
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView{
            
            
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]), startPoint: .top, endPoint: .trailing) // Color(Literal) ->調色盤
                    .ignoresSafeArea()
                Color(.init(white:0.99, alpha: 1))
                    .offset(y: 400)
                
                ScrollView(){
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go ?")
                        Spacer()
                    }.font(.system(size: 12 , weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3 )))
                    .cornerRadius(10)
                    .padding(16)
                    
                     
                    
                    DiscoverCategoriesView()
                    VStack{
                    PopularDestinationsView()
                    PopularRestaurantsView()
                    TrendingCreatorsView()
                    }
                    .background(Color(.init(white:0.99, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top,32)
                }
            
            }.navigationTitle("Discover")
        }
     
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DiscoverView()
        }
    }
}













