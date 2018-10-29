//
//  SA_ProfileViewController.swift
//  Sample_Wiki_SearchApp
//
//  Created by Shankar K on 28/10/18.
//  Copyright © 2018 Shankar. All rights reserved.
//

import UIKit
import SDWebImage

class SA_ProfileViewController: UIViewController {

    private var viewModel :ProfileListViewModel = ProfileListViewModel()  {
        
        didSet {
            self.ProfilelistTableView.reloadData()
            self.ProfilelistTableView.isHidden = false
        }
    }
    var search = UISearchController(searchResultsController: nil)

    var didSelect: (ProfileViewModel) -> () = { Profile in
        
    }

    
    @IBOutlet var ProfilelistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProfilelistTableView.isHidden = true
        self.title = self.viewModel.title
        self.ProfilelistTableView.estimatedRowHeight = 90
        self.ProfilelistTableView.rowHeight = UITableView.automaticDimension
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.loadProfiles()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func loadProfiles() {
        
        self.view.makeToastActivity(.center)
        
        let url = URL(string: "https://test-api.nevaventures.com")!
        if self.checkForConnection(){
        
            Webservice().getProfiles(url: url) { profiles in
                self.view.hideToastActivity()

                let profiles = profiles.map { profile in
                    return ProfileViewModel(profile :profile)
                }
                
                self.viewModel = ProfileListViewModel(profiles :profiles)
                self.ProfilelistTableView.isHidden = false
                self.ProfilelistTableView.reloadData()
            }
        }else{
            search.isActive = false
            self.view.makeToast("No Internet,please check your network or WiFi connection", duration: 3.0, position: .center)
        }
    }
    
}


extension SA_ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        search.isActive = false
        
        _ = self.viewModel.profiles[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Common.CellIdentifier.searchCell , for: indexPath) as! SA_ProfileTableViewCell
        let profileViewModel = self.viewModel.profiles[indexPath.row]
        
        cell.nameLabel?.text = profileViewModel.name
        cell.detailDescription?.text = profileViewModel.description
        if profileViewModel.avatarURL != "" {
            let url = URL.init(string: profileViewModel.avatarURL)
            cell.avatarImage!.sd_setImage(with: url, completed: nil)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
