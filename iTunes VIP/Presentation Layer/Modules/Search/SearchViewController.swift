//
//  ViewController.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import UIKit

protocol SearchPresenterOutput: class {
    func didEnterMedia()
    func didEnterResults(url: String)
    
    func presenter(didRetriveMedia media: String)
}

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mediaTextView: UITextView!
    
    //MARK:- properties
    var interactor: SearchInteractor?
    var router: SearchRouter?
    
    
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        SearchConfigurator.configureModule(viewController: self)
        interactor?.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.viewWillAppear()
    }

//MARK:- buttons
    @IBAction func MediaButtonPressed(_ sender: Any) {
        interactor?.didEnterMediaSelection()
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        if searchTextField.text != ""{
            if mediaTextView.text != ""{
                interactor?.submitTapped(term: searchTextField.text ?? "", media: mediaTextView.text)
            }else{
                mediaTextView.shake()
            }
        }else{
                searchTextField.shake()
        }
        
    }
}

//MARK:- presenter output
extension SearchViewController: SearchPresenterOutput{
    func didEnterResults(url: String) {
        self.router?.routeToResults(url: url)
    }
    
    func presenter(didRetriveMedia media: String) {
        self.mediaTextView.text = media
    }
    
    func didEnterMedia() {
        self.router?.routeToMedia()
    }
    
    
}
