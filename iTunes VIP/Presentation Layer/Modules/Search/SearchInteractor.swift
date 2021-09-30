//
//  SearchInteractor.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import Foundation

protocol SearchInteractor: class {
    func viewDidLoad()
    
    func viewWillAppear()
    
    func didEnterMediaSelection()
    func submitTapped(term: String , media: String)
}

class SearchInteractorImplementation: SearchInteractor{
  
    
    var presenter : SearchPresenter?

    private var media : String?
    
    func viewDidLoad() {
        UserDefaults.standard.setValue("", forKey: "MediaType")

    }
    
    func viewWillAppear() {
        media = UserDefaults.standard.string(forKey: "MediaType")
        presenter?.interactor(didRetriveMedia: media ?? "")
   
    }
    
    func didEnterMediaSelection() {
        presenter?.interactorDidEnterMedia()
        
    }
    
    func submitTapped(term: String , media: String) {
        let url = "https://itunes.apple.com/search?term=\(term)&entity=\(media)"
        
        presenter?.interactor(submitTapped: url)
    }

    
}
