//
//  ActionButtonView.swift
//  intercede
//
//  Created by Parker Johnson on 2/8/26.
//

import SwiftUI

struct ActionButtonView: View {
    var body: some View {
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
                        //                    .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
                    }
                    .buttonStyle(.glass)
                    
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
                        //                    .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
                    }
                    .buttonStyle(.glass)
                }
                .padding(.horizontal, 32)
    }
}

#Preview {
    ActionButtonView()
}
