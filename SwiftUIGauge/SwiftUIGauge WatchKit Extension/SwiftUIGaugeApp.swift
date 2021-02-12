//
//  SwiftUIGaugeApp.swift
//  SwiftUIGauge WatchKit Extension
//
//  Created by 宇宣 Chen on 2021/2/12.
//

import SwiftUI

@main
struct SwiftUIGaugeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
