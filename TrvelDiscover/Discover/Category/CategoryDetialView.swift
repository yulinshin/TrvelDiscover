 
 import SwiftUI

 import SDWebImageSwiftUI

 class CaregoryDetialViewModle: ObservableObject {
     
     @Published var isLoading = true///宣告isLoading 狀態 預設為true
     @Published var arts = [AirTableRecord]()
     @Published var errorMesage = ""
     init(){
         
         
     
     DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        
         self.isLoading = false
         guard let url = URL(string: "https://api.airtable.com/v0/appUJv9kyMlHpugJ7/Art") else {
             return
         }
         
         var request = URLRequest(url: url)
         request.setValue("Bearer key8KpavO46ECgfcC", forHTTPHeaderField: "Authorization")
         request.httpMethod = "GET"
         URLSession.shared.dataTask(with: request) { data, resp, err in
             
             guard let data = data else { return }
             do{
                 let reords = try JSONDecoder().decode(AirtableRecords.self, from: data)
                 self.arts = reords.records
             }
             catch{
                 
                 print("Failed to decode JSON",error)
                 self.errorMesage = error.localizedDescription
             }
         }.resume()


         }
         
     }
     
 }

 struct CategoryDetialView: View {
     
     @ObservedObject var vm = CaregoryDetialViewModle() /// 宣告VM
     
     var body: some View{
             
             if vm.isLoading == true{
                 VStack{
                     ActiveIndicatorView()
                     Text("loading")
                         .font(.system(size: 12, weight: .semibold))
                         .foregroundColor(.white)
                 }
                 .padding()
                 .background(Color.black)
                 .cornerRadius(6)
                
             }else{
                 
                 ZStack{
                     Text(vm.errorMesage)
                     ScrollView(.vertical){
                         VStack(spacing: 12){
                             ForEach(vm.arts, id: \.self) { art in
                             VStack{
                               WebImage(url: URL(string: art.fields.thumbnail))
                                     .resizable()
                                     .scaledToFill()
                                     .clipped()
                                     .frame(height: 200)
                                 
                                 HStack{
                                     Text(art.fields.name)
                                     .font(.system(size: 14, weight: .semibold))
                                 Spacer()
                                 }
                                 .padding()
                                 .background(Color.white)
                                 
                             }
                            
                             .asTile()
                         }
                     }.padding(.horizontal)
                         .padding(.top)
                     
                     }
                 }
           .navigationBarTitle("Category", displayMode: .inline)
             }
         
     }
 }

 struct CategoryDetialView_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
         CategoryDetialView()
     }
     }
 }
