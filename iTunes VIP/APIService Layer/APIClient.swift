//
//  APIClient.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import Foundation
import Alamofire


class APIClient{
    public static let sharedInstance = APIClient()

        
    //MARK:- getData
    func getData<T: Codable, E: Codable>(url: String, method: HTTPMethod , completion: @escaping(T?, E?, Error?) -> Void ){
            
            
        AF.request(url, method: method, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 300)
                .responseJSON{ (response) in
                    
                guard let data = response.data else {return}
                switch response.result{
                case .success(_):
                    do{
                        let json = try JSONDecoder().decode(T.self, from: data)
                        completion(json, nil, nil)
                         print(json)
                    } catch let jsonError {
                        print(jsonError)
                    }
                case .failure(let error):
                    let statusCode = response.response?.statusCode ?? 0
                    if statusCode > 300 {
                        do{
                            guard let data = response.data else { return }
                            let responseError = try JSONDecoder().decode(E.self, from: data)
                            completion(nil, responseError, nil)
                            
                        } catch let jsonError {
                            print(jsonError)
                        }
                    }else{
                        print(error)
                        completion(nil, nil, error)

                    }
                    
                    
                }
            }
        }
}
