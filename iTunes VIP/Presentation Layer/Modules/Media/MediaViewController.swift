//
//  MediaViewController.swift
//  iTunes VIP
//
//  Created by hashem on 25/09/2021.
//

import UIKit

protocol MediaPresenterOutput: class {
    func presenter(didRetriveMedia media: [String])
}

class MediaViewController: UIViewController {
   
   @IBOutlet weak var mediaTableView: UITableView!
   
    // MARK: - Properties
    var interactor: MediaInteractor?
    weak var presenter: MediaPresenter?
    var router: MediaRouter?
    
    var media : [String] = []
    var selectedMedia: String?
    
    lazy var addBarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(addBarButtonItemTapped)
        )
        return item
    }()
    
    
    //MARK:- viewlife cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
        mediaTableView.register(UINib(nibName: "MediaCell", bundle: nil), forCellReuseIdentifier: "MediaCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Select Media Types"

        navigationItem.rightBarButtonItem = addBarButtonItem

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
        
    
    //MARK:-Actions
    @objc func addBarButtonItemTapped(){
        
        UserDefaults.standard.setValue(selectedMedia, forKey: "MediaType")

        navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- presenter output
extension MediaViewController: MediaPresenterOutput{
    func presenter(didRetriveMedia media: [String]) {
        
        self.media = media
        mediaTableView.reloadData()
    }
    
}

//MARK:- tableview
extension MediaViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        
        cell.mediaLabel.text = media[indexPath.row]
        cell.checkImage.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMedia = media[indexPath.row]
        print(media[indexPath.row])
        
    }
}
