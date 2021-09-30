//
//  ResultsViewController.swift
//  iTunes VIP
//
//  Created by hashem on 9/28/21.
//

import UIKit

protocol ResultsPresenterOutput: class{

    func presenter(didRetriveResults results: ResultModel)
    func presenter(didRetriveResultsError results: ResultErrorModel)
    func presenter(didFailRetriveResults error: String)
}



class ResultsViewController: UIViewController {
   
    @IBOutlet weak var resultsCollection: UICollectionView!
    
    // MARK: - Properties
    var interactor: ResultsInteractor?
    var router: resultsRouter?
    
    var listFlag = true
    
    private var Results: [ResultModel.Results] = []
    
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsCollection.register(UINib(nibName: "listCell", bundle: nil), forCellWithReuseIdentifier: "listCell")
        resultsCollection.register(UINib(nibName: "gridCell", bundle: nil), forCellWithReuseIdentifier: "gridCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        let logo = UIImage(named: "itunes.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    //MARK:- buttons
    @IBAction func gridButtonPressed(_ sender: Any) {
        listFlag = false
        
        resultsCollection.reloadData()
        
    }
    
    @IBAction func listButtonPressed(_ sender: Any) {
        listFlag = true
        resultsCollection.reloadData()

    }

}
// MARK: - Presenter Output
extension ResultsViewController: ResultsPresenterOutput{
    
    func presenter(didRetriveResults results: ResultModel) {
        guard let resultArr = results.results else {return}
        
        self.Results = resultArr
        print(Results)
        resultsCollection.reloadData()
    }
    
    func presenter(didRetriveResultsError results: ResultErrorModel) {
        showError(with: results.errorMessage ?? "results error")
    }
    
    func presenter(didFailRetriveResults error: String) {
        showError(with: error)
    }
}

// MARK: - uiCollection 

extension ResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if listFlag{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! listCell
            cell.resultName.text = Results[indexPath.row].artistName
            cell.resultAuthor.text = Results[indexPath.row].trackName
            cell.resultImage.loadImage(URL(string: Results[indexPath.row].artworkUrl100 ?? ""))
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! gridCell
            cell.resultName.text = Results[indexPath.row].artistName
            cell.resultImage.loadImage(URL(string: Results[indexPath.row].artworkUrl100 ?? ""))

            return cell

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if listFlag{
            return CGSize(width: view.frame.width, height: view.frame.height / 5 )
        }else{
            return CGSize(width: view.frame.width / 4 , height: view.frame.height / 4 )

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! headerView
        headerView.headerName.text = UserDefaults.standard.string(forKey: "MediaType")
        headerView.frame.size.height = 50
        headerView.frame.size.width = collectionView.frame.width
        return headerView

    }
    
}
