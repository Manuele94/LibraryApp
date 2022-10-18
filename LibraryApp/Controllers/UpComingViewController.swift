//
//  UpComingViewController.swift
//  LibraryApp
//
//  Created by Emmanuele Montagna on 15/10/22.
//

import UIKit

class UpComingViewController: UIViewController {
    
    private var titles: YTItems = []
    
    private let upcomingTable: UITableView = {
       
        let table = UITableView()
        table.register(CustomTableviewCell.self, forCellReuseIdentifier: CustomTableviewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "YouTubeVideo"
       // navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        
        fetchUpcoming()
        // Do any additional setup after loading the view.
    }
    
    private func fetchUpcoming() {
        APICaller.shared.getAllContryVideoWithAlamo { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles.items
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UpComingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableviewCell.identifier, for: indexPath) as? CustomTableviewCell else {
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: title)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
