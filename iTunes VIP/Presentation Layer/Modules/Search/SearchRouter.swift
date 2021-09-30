//
//  SearchRouter.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import UIKit

protocol SearchRouter: class {
    var navigationController: UINavigationController? { get }
    
    func routeToMedia()
    
    func routeToResults(url: String)
}

class SearchRouterImplementation: SearchRouter {
    weak var navigationController: UINavigationController?
    
    func routeToMedia() {
        let viewController = UIStoryboard(name: "MediaStory", bundle: nil).instantiateViewController(withIdentifier: "MediaViewController") as! MediaViewController
        
        
        MediaConfigurator.configureModule(viewController: viewController)
        
        

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func routeToResults(url: String){
        let vc = UIStoryboard(name: "Results", bundle: nil).instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        ResultsConfigurator.configureModule(viewController: vc)
        
        vc.interactor?.viewDidLoad(url: url)
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }

    
    
}
