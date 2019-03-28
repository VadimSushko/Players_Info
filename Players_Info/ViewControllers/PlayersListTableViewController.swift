//
//  PlayersListTableViewController.swift
//  Players_Info
//
//  Created by Vadym Sushko on 3/26/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import UIKit
import SwiftyJSON

class PlayersListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var players = [PlayerModel]() {
        didSet {
            activityIndicator.stopAnimating()
            myTableView.reloadData()
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadData()
    }
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerInfoTableViewCell
        cell.shortNameLabel.text = players[indexPath.row].shortName 
        cell.ageLabel.text = "age: " + String(players[indexPath.row].age)
        cell.heightLabel.text = "height: " + String(players[indexPath.row].height)
        cell.footNameLabel.text = "foot: " + players[indexPath.row].footName
        cell.currentSquadLabel.text = "current squad: " + players[indexPath.row].currentSquad.name
        cell.parrentSquadLabel.text = "parent squad: " + players[indexPath.row].parentSquad.name
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    
    
    
    func loadData() {
        
        activityIndicator.startAnimating()
        let urlString = "https://apidev.transferroom.com/api/values"
        let url = URL(string: urlString)
        let session = URLSession.shared
        
         DispatchQueue.global(qos: .userInteractive).async {
        
        session.dataTask(with: url!) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                let code = response.statusCode
                if (code >= 200 &&  code <= 299) {
                    if let data = data {
                        do {
                            let json = try JSON(data: data)
                            

                            let names = json.arrayValue.map({$0["shortName"].stringValue})
                            let ages = json.arrayValue.map({$0["age"].int32})
                            let heights = json.arrayValue.map({$0["height"].int32})
                            let footNames = json.arrayValue.map({$0["footName"].stringValue})
                            let currentSquadNames = json.arrayValue.map({$0["currentSquad"]["name"].stringValue})
                            let parentSquadNames = json.arrayValue.map({$0["parentSquad"]["name"].stringValue})

                            var playersInResponse = [PlayerModel]()

                            for i in 0 ..< names.count {
                                let player = PlayerModel(shortName: names[i], height: heights[i] ?? 0, age: ages[i] ?? 0, footName: footNames[i], parentSquad: SquadModel(name: parentSquadNames[i]), currentSquad: SquadModel(name: currentSquadNames[i]))
                                playersInResponse.append(player)
                            }
                            DispatchQueue.main.async {
                                
                                self.players = playersInResponse
                            }
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            }.resume()
        }
    }
}
