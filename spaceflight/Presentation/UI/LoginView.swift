//
//  LoginView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import Combine

struct LoginView: View {
    @EnvironmentObject var auth: AuthState
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @FocusState private var focusedField: Field?
    @Environment(\.isUITesting) private var isUITesting

    enum Field {
        case email
        case password
    }

    var body: some View {
        ZStack {
            // background aman, tidak blok tap
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                // Judul
                VStack(spacing: 6) {
                    Text("Test iOS SwiftUI Pertama")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("Silakan masuk ke akunmu")
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }

                // Card form
                VStack(alignment: .leading, spacing: 16) {
                    Group {
                        Text("Username / Email")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        TextField("Masukkan email Anda", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .focused($focusedField, equals: .email)
                            .accessibilityIdentifier("emailField")
                    }

                    Group {
                        Text("Kata Sandi")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        HStack {
                            if (showPassword || isUITesting) { // <— tambahkan ini
                                TextField("Masukkan Password Anda", text: $password)
                                    .accessibilityIdentifier("passwordField")
                                    .focused($focusedField, equals: .password)
                            } else {
                                SecureField("Masukkan Password Anda", text: $password)
                                    .accessibilityIdentifier("passwordField")
                                    .focused($focusedField, equals: .password)
                            }
                            
                            Button {
                                withAnimation {
                                    showPassword.toggle()
                                }
                            } label: {
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    // Tombol Login
                    Button(action: {
                        withAnimation(.spring()) {
                            auth.loginMock()
                        }
                    }) {
                        Text("Masuk")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(email.isEmpty || password.isEmpty ? Color.gray : Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .accessibilityIdentifier("loginButton")
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                .padding(.horizontal, 24)

                Spacer()
            }
            .onTapGesture {
                focusedField = nil // tutup keyboard saat tap di luar
            }
        }
        .preferredColorScheme(.light)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Selesai") {
                    focusedField = nil
                }
            }
        }
    }
}

extension EnvironmentValues {
    var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("UI-TESTING")
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthState.shared)
        .preferredColorScheme(.light)
}
