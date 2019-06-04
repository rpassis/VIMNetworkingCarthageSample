//
//  ViewController.swift
//  VIMNetworkingCarthageSample
//
//  Created by Rogerio de Paula Assis on 6/4/19.
//  Copyright © 2019 Vimeo. All rights reserved.
//

import UIKit
import VimeoNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appConfiguration = AppConfiguration(
            clientIdentifier: "Your client identifier goes here",
            clientSecret: "Your client secret goes here",
            scopes: [.Public, .Private, .Interact],
            keychainService: "YourKeyChainService"
        )
        
        let vimeoClient = VimeoClient(appConfiguration: appConfiguration, configureSessionManagerBlock: nil)
        
        let authenticationController = AuthenticationController(
            client: vimeoClient,
            appConfiguration: appConfiguration,
            configureSessionManagerBlock: nil
        )
        
        authenticationController.accessToken(token: "your_access_tocken") { result in
            switch result {
            case .success(let account):
                print("authenticated successfully: \(account)")
            case .failure(let error):
                print("failure authenticating: \(error)")
            }
        }
    }


}

