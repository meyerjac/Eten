import UIKit

class mainFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedIndex: Int = 0
    
//    @IBOutlet var buttons: [UIImage]!
    
    var ProfileViewController: UIViewController!
    var WalletViewController: UIViewController!
    var MapViewController: UIViewController!

    var viewControllers: [UIViewController]!
    
    let restaurantList = ["Chipotle", "Izumi Sushi and Grill", "B2 Bar and Grill", "Cafe Yumm!", "Poppi's Anatolia", "The Good Times Pho", "Morning Glory Café", "Mezza Luna Pizzeria", "Sizzle Pie", "Track Town Pizza"]
    
    let restaurantListImages = ["chipotle.png", "sushi.png", "bar.jpg", "cafe_yum.png", "poppis.jpg", "pho.jpg", "cafe.jpg", "mezza.png", "work_sizzle_pie.jpg", "tracktownpizza.jpg"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
            let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! eateriesMainFeedTableViewCell
        
            Cell.BusinessName.text = restaurantList[indexPath.row]
        print(1)
            Cell.BusinessProfileImage.image = UIImage(named: restaurantListImages[indexPath.row])
        print(2)
        
            return Cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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

