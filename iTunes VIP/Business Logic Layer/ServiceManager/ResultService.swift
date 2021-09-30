//
//  ResultService.swift
//  iTunes VIP
//
//  Created by hashem on 28/9/21.
//

import Foundation

protocol ResultService: class {
    func getResults(url: String, completion: @escaping(ResultModel?, ResultErrorModel?, Error?) -> Void) -> Void
}

class ResultsServiceImplementation: ResultService {
    var resultModel : ResultModel?
    var resultError : ResultErrorModel?
    var error : Error?
    
    
    func getResults(url: String, completion: @escaping(ResultModel?, ResultErrorModel?, Error?) -> Void) -> Void   {
        
            APIClient.sharedInstance.getData(url: url, method: .get) {  (resultSucces: ResultModel?, resultFailure: ResultErrorModel?, err) in
                            

                if let errCheck = err{
                    completion(nil , nil , errCheck)

                }
                if let resultErrorCheck = resultFailure{
                    completion(nil , resultErrorCheck , nil)

                }
                if let resultSuccessCheck = resultSucces{
                    completion(resultSuccessCheck , nil , nil)

                }

            }

    }
    
}






