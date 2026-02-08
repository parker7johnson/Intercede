//
//  ChurchCodeView.swift
//  intercede
//
//  Created by Parker Johnson on 2/8/26.
//

import SwiftUI

struct ChurchCodeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var churchCode: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Change Church Code")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.25))

                    Text("Get your unique code from your church administrator")
                        .font(.subheadline)
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.45))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 40)

                VStack(spacing: 16) {
                    TextField("Church Code", text: $churchCode)
                        .textFieldStyle(.plain)
                        .font(.title2)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                        .textInputAutocapitalization(.characters)
                        .autocorrectionDisabled()

                    Button(action: {
                        // Save logic will go here
                        dismiss()
                    }) {
                        Text("Save Church Code")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.25))
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
                    }
                    .buttonStyle(.glass)
                    .disabled(churchCode.isEmpty)
                    .opacity(churchCode.isEmpty ? 0.5 : 1.0)
                }
                .padding(.horizontal, 32)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.96, green: 0.96, blue: 0.86))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                    }
                }
            }
        }
    }
}

#Preview {
    ChurchCodeView()
}
