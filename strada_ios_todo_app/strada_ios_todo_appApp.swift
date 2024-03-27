//
//  strada_ios_todo_appApp.swift
//  strada_ios_todo_app
//
//  Created by Marco Fiorito on 27/3/24.
//

import SwiftUI
import UIKit
import Turbo

@main
class AppDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
     private lazy var navigationController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         guard let _ = (scene as? UIWindowScene) else { return }
         window!.rootViewController = navigationController
         visit(url: URL(string: "https://turbo-native-demo.glitch.me")!)
     }
     
    private func visit(url: URL) {
         let viewController = VisitableViewController(url: url)
         navigationController.pushViewController(viewController, animated: true)
         session.visit(viewController)
     }
     
     private lazy var session: Session = {
         let session = Session()
         session.delegate =  self
         return session
     }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    funct AppDelegate () {
        
    }
}

extension AppDelegate: SessionDelegate {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
         visit(url: proposal.url)
     }
     
     func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error) {
         print("didFailRequestForVisitable: \(error)")
     }
     
     func sessionWebViewProcessDidTerminate(_ session: Session) {
         session.reload()
     }
}
