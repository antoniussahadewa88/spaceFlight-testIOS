//
//  AuthState.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import Combine
import UserNotifications

final class AuthState: ObservableObject {
    static let shared = AuthState()
    @Published var isLoggedIn: Bool = false

    private let expiryKey = "session_expiry"

    private init() {
        LocalNotificationScheduler.requestPermissionIfNeeded()
    }

    // MARK: - LOGIN MOCK
    func loginMock() {
        isLoggedIn = true
        KeychainHelper.shared.saveAuth(token: "mock_token")
        scheduleAutoLogout()
        print("✅ Login success at \(Date())")
    }

    // MARK: - LOGOUT
    func logout() {
        isLoggedIn = false
        KeychainHelper.shared.clearAuth()
        LocalNotificationScheduler.cancelAutoLogout()
        UserDefaults.standard.removeObject(forKey: expiryKey)
        print("🚪 Logged out (manual or expired)")
    }

    // MARK: - AUTO LOGOUT (10 minutes)
    private func scheduleAutoLogout() {
        let expiry = Date().addingTimeInterval(300) // 5 menit
        UserDefaults.standard.set(expiry, forKey: expiryKey)

        // Local notification
        LocalNotificationScheduler.scheduleAutoLogout(after: 300)

        // Auto logout otomatis (walau tanpa notifikasi)
        DispatchQueue.main.asyncAfter(deadline: .now() + 300) { [weak self] in
            guard let self else { return }
            if self.isLoggedIn { self.logout() }
        }

        print("⏱️ Auto logout scheduled for \(expiry)")
    }

    // MARK: - RESTORE SESSION
    func restoreSessionIfNeeded() {
        if let expiry = UserDefaults.standard.object(forKey: expiryKey) as? Date {
                if expiry > Date() {
                    isLoggedIn = true
                    print("⏳ Session valid until \(expiry)")
                } else {
                    logout()
                }
            } else {
                // Pastikan logged out jika tidak ada data
                isLoggedIn = false
            }
    }
}
