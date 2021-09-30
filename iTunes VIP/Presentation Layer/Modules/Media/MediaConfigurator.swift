//
//  MediaConfigurator.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import Foundation
class MediaConfigurator {
    
    static func configureModule(viewController: MediaViewController) {
        let router = MediaRouterImplementation()
        let interactor = MediaInteractorImplementation()
        let presenter = MediaPresenterImplementation()
        
        
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
}
