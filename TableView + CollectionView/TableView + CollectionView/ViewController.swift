//
//  ViewController.swift
//  TableView + CollectionView
//
//  Created by Admin on 04/02/23.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var movieTableView: UITableView!
    
    let bollywoodMovies:[UIImage] = [#imageLiteral(resourceName: "B4") , #imageLiteral(resourceName: "B5") , #imageLiteral(resourceName: "B3") , #imageLiteral(resourceName: "B1") , #imageLiteral(resourceName: "B2")]
    let hollywoodMovies:[UIImage] = [#imageLiteral(resourceName: "H4") , #imageLiteral(resourceName: "H3") , #imageLiteral(resourceName: "H1") , #imageLiteral(resourceName: "H2") , #imageLiteral(resourceName: "H5") ]
    let marathiMovies:[UIImage] = [#imageLiteral(resourceName: "M2") , #imageLiteral(resourceName: "M3") , #imageLiteral(resourceName: "M1") , #imageLiteral(resourceName: "M4") , #imageLiteral(resourceName: "M5")]
    let southMovies:[UIImage] = [#imageLiteral(resourceName: "S5") , #imageLiteral(resourceName: "S2") , #imageLiteral(resourceName: "S1") , #imageLiteral(resourceName: "S3") , #imageLiteral(resourceName: "S4")]
    let headerTitle:[String] = ["Hollywood Movies","Bollywood Movies","South Indian Movies","Marathi Movies"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        movieTableView.dataSource = self
        movieTableView.delegate = self
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        movieTableView.register(nib, forCellReuseIdentifier: "tableCell")
        movieTableView.backgroundColor = .black
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! MovieTableViewCell
        cell.width = movieTableView.frame.size.width
        switch (indexPath.section){
        case 0:  cell.moviesImage = hollywoodMovies
                 break
        case 1:  cell.moviesImage = bollywoodMovies
                 break
        case 2:  cell.moviesImage = southMovies
                 break
        case 3:  cell.moviesImage = marathiMovies
                 break
        default: break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let width = tableView.frame.size.width
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 30))
        let label = UILabel(frame: CGRect(x: 2, y: 0, width: width-20, height: 30))

        switch section{
        case 0: label.text = headerTitle[0]
                break
        case 1: label.text = headerTitle[1]
                break
        case 2: label.text = headerTitle[2]
                break
        case 3: label.text = headerTitle[3]
                break
        default:
            break
        }
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        headerView.addSubview(label)
        headerView.backgroundColor = .black
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

