import UIKit

class triviaViewController: UIViewController {
    
    var factArray = ["The actress that plays Sansa Stark adopted her Direwolf in real life.", "You can study Game of Thrones at Harvard University.", "Daenerys was doused in so much fake blood during the horse heart eating scene that she got stuck to a toilet seat during a break.", "The actor who plays the 13 year old Jojan Reed was actually 22 in real life.", "After filming his death scene, Sean Bean played football with his replica head.", "Only two episodes have no deaths.", "There is an unaired pilot episode.", "The Three Eyes Raven before Bran was a Targaryen bastard.", "Season 1 cost between $50 to $60 million to film, season 6 cost $100million.", "The Mountain has been played by 3 different actors.", "The Dothraki language is real", "The actress who plays Brienne of Tarth doesn't know her birthday.", "Lena Headey (Cersei) and Jerome Flynn (Bronn) went through a breakup which ended on bad terms, their contracts state they cannot share scenes together."]
    
    var count = 1;
    
    @IBOutlet var background_Image: UIImageView!
    
    @IBOutlet var mainMenuOutlet: UIButton!
    
    @IBOutlet var nextFactOutlet: UIButton!
    
    @IBOutlet var factLabel: UILabel!
    
/*****************************************************************************************
 * Function name : nextFactButton()
 *    returns : N/A
 *    arg1 : N/A
 * Created by : Kieran Foley
 * Date created : 07/08/2017
 * Date last modified : 12/08/17
 * Description :
 *  Goes through the whole array and loops round once it has reached the last one.
 *****************************************************************************************/
    @IBAction func nextFactButton(_ sender: UIButton) {
        
        factLabel.text = factArray[count]
        
        count += 1;
        
        if (count == factArray.count) {
            count = 0;
        }
    }
    
    // Moves the view back to the main Menu.
    @IBAction func mainMenuButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mainMenu", sender: self)
    }

    // Styles the buttons and displays the facts on a label.
    override func viewDidLoad() {
        super.viewDidLoad()

        mainMenuOutlet.layer.cornerRadius = 5;
        mainMenuOutlet.layer.borderWidth = 4;
        mainMenuOutlet.layer.borderColor = UIColor.lightGray.cgColor;
        mainMenuOutlet.backgroundColor = UIColor.clear;
        mainMenuOutlet.setTitleColor(UIColor.white, for: .normal);
        mainMenuOutlet.setTitle("Main Menu", for: .normal);
        
        nextFactOutlet.layer.cornerRadius = 5;
        nextFactOutlet.layer.borderWidth = 4;
        nextFactOutlet.layer.borderColor = UIColor.lightGray.cgColor;
        nextFactOutlet.backgroundColor = UIColor.clear;
        nextFactOutlet.setTitleColor(UIColor.white, for: .normal);
        nextFactOutlet.setTitle("Next Fact", for: .normal);
        
        factLabel.text = factArray[0];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
