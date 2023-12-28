//
//  hablerlerVC.swift
//  teknoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.12.2023.
//

import UIKit
import Firebase
import SDWebImage
class hablerlerVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var haberAdiArray = [String]()
    var haberIcerikArray = [String]()
    var haberImageArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirestore()

    }
    func getDataFromFirestore() {
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                if snapshot?.isEmpty != true {
                    
                    self.haberImageArray.removeAll(keepingCapacity: false)
                    self.haberAdiArray.removeAll(keepingCapacity: false)
                    self.haberIcerikArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        if let postName = document.get("postName") as? String {
                            self.haberAdiArray.append(postName)
   
                        }
                        if let postContent = document.get("postContent") as? String {
                            self.haberIcerikArray.append(postContent)

                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.haberImageArray.append(imageUrl)

                        }
                    }
                    self.tableView.reloadData()
                    
                }
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haberAdiArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.haberLabel.text = haberAdiArray[indexPath.row]
        cell.icerikLabel.text = haberIcerikArray[indexPath.row]
        cell.haberImageView.sd_setImage(with: URL(string: self.haberImageArray[indexPath.row]))
        
        return cell
    }

    

}
