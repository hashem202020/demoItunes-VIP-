//
//  ResultsInteractor.swift
//  iTunes VIP
//
//  Created by hashem on 9/28/21.
//

import Foundation

protocol ResultsInteractor: class {
    func viewDidLoad(url: String)
}


class ResultsInteractorImplementation: ResultsInteractor{
  
    var presenter: ResultsPresenter?
    
    private let resultService = ResultsServiceImplementation()
  
    func viewDidLoad(url: String) {
        
         resultService.getResults(url: url)  {resultModel , resultFailure , error in
                     
            if let resultSuccessCheck = resultModel  {
                self.presenter?.interactor(didRetriveResults: resultSuccessCheck)
            }
            
            if let resultErrorCheck = resultFailure {
                self.presenter?.interactor(didRetriveResultsError: resultErrorCheck)
            }
            
            if let errCheck = error  {
                self.presenter?.interactor(didFailRetriveResults: errCheck)

            }
        }
        
    }
}
