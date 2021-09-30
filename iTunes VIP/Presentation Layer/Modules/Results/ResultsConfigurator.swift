//
//  ResultsConfigurator.swift
//  iTunes VIP
//
//  Created by hashem on 9/28/21.
//

import UIKit

class ResultsConfigurator {
    
    static func configureModule(viewController: ResultsViewController) {
        let router = ResultsRouterImplementation()
        let interactor = ResultsInteractorImplementation()
        let presenter = ResultsPresenterImplementation()
        
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
