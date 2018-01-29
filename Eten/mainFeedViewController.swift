import UIKit

class mainFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var images: [UIButton]!
    
    var selectedIndex: Int = 0
    
    var TabSelectedImagesName = ["listg.png","green_wallet.png", "camg.png", "green_profile.png", "green_map.png"]
    
    var TabUnSelectedImagesName = ["grey_list.png","grey_wallet.png","grey_camera.png",  "grey_profile.png", "grey_map.png"]
    
    var ProfileViewController: UIViewController!
    var WalletViewController: UIViewController!
    var CameraViewController: UIViewController!
    var MapViewController: UIViewController!

    var viewControllers: [UIViewController]!
    
    let restaurantList = ["Chipotle", "Izumi Sushi and Grill", "B2 Bar and Grill", "Cafe Yumm!", "Poppi's Anatolia", "The Good Times Pho", "Morning Glory Café", "Mezza Luna Pizzeria", "Sizzle Pie", "Track Town Pizza"]
    
    let restaurantListImages = ["chipotle.png", "sushi.png", "bar.jpg", "cafe_yum.png", "poppis.jpg", "pho.jpg", "cafe.jpg", "mezza.png", "work_sizzle_pie.jpg", "tracktownpizza.jpg"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        MapViewController = storyboard.instantiateViewController(withIdentifier: "Map")
//        WalletViewController = storyboard.instantiateViewController(withIdentifier: "Wallet")
//        ProfileViewController = storyboard.instantiateViewController(withIdentifier: "Profile")
//        CameraViewController = storyboard.instantiateViewController(withIdentifier: "Camera")
//
//        viewControllers = [MapViewController, WalletViewController , CameraViewController, ProfileViewController]
        
        images[selectedIndex].isSelected = true
        didPressTab(images[selectedIndex])
        
    }
    
    
    @IBAction func didPressTab(_ sender: UIButton) {

            let bgImage = UIImage(named: TabSelectedImagesName[sender.tag])
            sender.setImage(bgImage, for: .selected)
            sender.isSelected = true
        
        
       
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        images[previousIndex].isSelected = false
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

