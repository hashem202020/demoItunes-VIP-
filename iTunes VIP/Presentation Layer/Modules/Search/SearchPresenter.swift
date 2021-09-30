//
//  SearchPresenter.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import Foundation

protocol SearchPresenter: class {
    func interactor(didRetriveMedia media: String)
    
    func interactorDidEnterMedia()
    
    
    func interactor(submitTapped url: String)
}


class SearchPresenterImplementation: SearchPresenter {
    
    weak var viewController: SearchPresenterOutput?


    func interactor(didRetriveMedia media: String) {
        viewController?.presenter(didRetriveMedia: media)

    }
    
    
    func interactorDidEnterMedia() {
        viewController?.didEnterMedia()
        
    }
    
    func interactor(submitTapped url: String) {
        viewController?.didEnterResults(url: url)
    }

}
