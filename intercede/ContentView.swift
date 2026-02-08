import SwiftUI

struct ContentView: View {
    @State private var showingChurchSelector = false
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                
                VStack(spacing: 12) {
                    Text("Intercede")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.25))
                    
                    Text("Share your heart with your church")
                        .font(.title3)
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.45))
                }
                
                Spacer()
                
                ActionButtonView()
                
                Spacer()
                Button(action: {
                    showingChurchSelector = true
                }) {
                    HStack(spacing: 8) {
                        Text("Sharing with: Victory Church (WA)")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.25))
                        Image(systemName: "chevron.right")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.45))
                    }
                }
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.96, green: 0.96, blue: 0.86))
            .sheet(isPresented: $showingChurchSelector) {
                ChurchCodeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
