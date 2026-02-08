import SwiftUI

struct ContentView: View {
    var body: some View {
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

            VStack(spacing: 24) {
                Button(action: {
                    // Navigate to prayer request form
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "hand.raised.fill")
                            .font(.title)
                        Text("Prayer Request")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.25))
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
                }

                Button(action: {
                    // Navigate to praise report form
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "heart.fill")
                            .font(.title)
                        Text("Praise Report")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.25))
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
                }
            }
            .padding(.horizontal, 32)

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.96, green: 0.96, blue: 0.86))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
