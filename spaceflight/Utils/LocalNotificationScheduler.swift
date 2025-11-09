//
//  LocalNotificationScheduler.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import UserNotifications

enum LocalNotificationScheduler {
    static func requestPermissionIfNeeded() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            // ignore result for now
        }
    }

    static func scheduleAutoLogout(after seconds: TimeInterval) {
        requestPermissionIfNeeded()
        let content = UNMutableNotificationContent()
        content.title = "Anda Telah Terlogout"
        content.body = "Akun Anda sudah terlogout karena timeout."
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let req = UNNotificationRequest(identifier: "auto_logout", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(req)
    }

    static func cancelAutoLogout() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["auto_logout"])
    }
}
