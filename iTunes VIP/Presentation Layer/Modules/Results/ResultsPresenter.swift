//
//  ResultsPresenter.swift
//  iTunes VIP
//
//  Created by hashem on 9/28/21.
//

import Foundation
protocol ResultsPresenter: class {

    func interactor(didRetriveResults results: ResultModel)
    func interactor(didRetriveResultsError results: ResultErrorModel)
    func interactor(didFailRetriveResults error: Error)

    }

class ResultsPresenterImplementation: ResultsPresenter{
    weak var viewController: ResultsPresenterOutput?
    
    func interactor(didRetriveResults results: ResultModel) {
        viewController?.presenter(didRetriveResults: results)
    }
    
    func interactor(didRetriveResultsError results: ResultErrorModel) {
        viewController?.presenter(didRetriveResultsError: results)
    }
    
    func interactor(didFailRetriveResults error: Error) {
        viewController?.presenter(didFailRetriveResults: error.localizedDescription)
    }
    
    
    
    
    
}
