 
 import SwiftUI

 import SDWebImageSwiftUI

 class CaregoryDetialViewModle: ObservableObject {
     
     @Published var isLoading = true///宣告isLoading 狀態 預設為true
     @Published var items = [CategoryTableRecord]()
     @Published var errorMesage = ""
    init(name: String){
         
         
     
     DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        
       
        guard let url = URL(string: "https://api.airtable.com/v0/appUJv9kyMlHpugJ7/\(name )") else {
             return
         }
         var request = URLRequest(url: url)
         request.setValue("Bearer key8KpavO46ECgfcC", forHTTPHeaderField: "Authorization")
         request.httpMethod = "GET"
         URLSession.shared.dataTask(with: request) { data, resp, err in
            
            if let statusCode = (resp as? HTTPURLResponse)?.statusCode,
               statusCode >= 400{
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMesage = "error:\(statusCode)"
                    
                }
    
                return
            }
            
             
             guard let data = data else { return }
             do{
                 let reords = try JSONDecoder().decode(CategorytableRecords.self, from: data)
                 self.items = reords.records
                self.isLoading = false
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
    
    private let name: String
    @ObservedObject private var vm:CaregoryDetialViewModle
    
    init (name:String){
        self.name = name
        self.vm = .init(name: name)
    } 
        
//     @ObservedObject var vm = CaregoryDetialViewModle() /// 宣告VM
     
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
                             ForEach(vm.items, id: \.self) { item in
                             VStack{
                               WebImage(url: URL(string: item.fields.thumbnail))
                                     .resizable()
                                     .scaledToFill()
                                     .clipped()
                                     .frame(height: 200)
                                 
                                 HStack{
                                     Text(item.fields.name)
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
           .navigationBarTitle(name, displayMode: .inline)
             }
         
     }
 }

 struct CategoryDetialView_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
         CategoryDetialView(name: "foods")
     }
     }
 }
