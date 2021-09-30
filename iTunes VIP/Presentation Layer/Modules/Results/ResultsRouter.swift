//
//  ResultsRouter.swift
//  iTunes VIP
//
//  Created by hashem on 9/28/21.
//

import UIKit

protocol resultsRouter: class {
    var navigationController: UINavigationController? { get }

}

class ResultsRouterImplementation: resultsRouter{
    weak var navigationController: UINavigationController?

}
