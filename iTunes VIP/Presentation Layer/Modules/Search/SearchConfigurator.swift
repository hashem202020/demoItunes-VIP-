//
//  SearchConfigurator.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import Foundation
class SearchConfigurator {
    
    static func configureModule(viewController: SearchViewController) {
        let router = SearchRouterImplementation()
        let interactor = SearchInteractorImplementation()
        let presenter = SearchPresenterImplementation()
        
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
