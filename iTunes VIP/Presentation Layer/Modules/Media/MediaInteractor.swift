//
//  MediaInteractor.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import Foundation

protocol MediaInteractor: class {
    
    func viewDidLoad()
}

class MediaInteractorImplementation: MediaInteractor {
    
    
    var presenter: MediaPresenter?
    
//    private let mediaService = MediaServiceImplementation()
    private let media = ["album", "artist", "book", "movie", "musicVideo", "podcast", "song"]
    
    func viewDidLoad() {
        presenter?.interactor(didRetrieveMedia: media)
    }
}
