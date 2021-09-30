//
//  MediaPresenter.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import Foundation
protocol MediaPresenter: class {
    func interactor(didRetrieveMedia media: [String])
}

class MediaPresenterImplementation: MediaPresenter {
    
    var viewController: MediaPresenterOutput?

    func interactor(didRetrieveMedia media: [String]) {
        viewController?.presenter(didRetriveMedia: media)
    }
    
}
