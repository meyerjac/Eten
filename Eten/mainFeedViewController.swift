//
//  mainFeedViewController.swift
//  Eten
//
//  Created by Jackson Meyer on 1/27/18.
//  Copyright © 2018 Jackson Meyer. All rights reserved.
//

import UIKit

class mainFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let restaurantList = ["Chipotle", "Izumi Sushi and Grill", "B2 Bar and Grill", "Cafe Yumm!", "Poppi's Anatolia", "Pho The Good Times Asian Bistro", "Morning Glory Café", "Mezza Luna Pizzeria", "Sizzle Pie", "Track Town Pizza"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
            let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! eateriesMainFeedTableViewCell
        
            Cell.firstSliderView = CircleSlider(frame: self.sliderArea.bounds, options: nil)
            self.circleSlider?.addTarget(self, action: Selector("valueChange:"), forControlEvents: .ValueChanged)
            self.sliderArea.addSubview(self.circleSlider)
            Cell.BusinessName.text = restaurantList[indexPath.row]
            Cell.BusinessProfileImage.image = UIImage(named: "food.jpeg")
        
        
        
        
            return Cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    func fetchPosts() {
        
//        var refExists: DatabaseReference!
//        refExists = Database.database().reference()
//
//        refExists.child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
//
//            if snapshot.hasChild("Corvallis") {
//                self.tableView.isHidden = false
//
//                Database.database().reference().child("posts").child(self.currentCity).observe(.childAdded) { (snapshot) in
//
//                    if let dictionary = snapshot.value as? [String: AnyObject] {
//                        let post = Post(snapshot: snapshot)
//                        self.posts.append(post)
//
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                        }
//                    }
//                }
//            }else{
//                print("city doesn't exist")
//                self.tableView.isHidden = true
//                self.handleAlertWhenNoTableViewItemsExist()
//            }
//        })
    }
    
    func handleAlertWhenNoTableViewItemsExist() {
        let alert = UIAlertController(title: "Error", message: "corkboard hasn't made it to your city yet, start the conversation!", preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "okay", style: .cancel, handler: { action in
            switch action.style{
            case .cancel:
                print("cancel")
            case .default:
                print("default case")
            case .destructive:
                print("destructive case")
            }
        }))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

