import UIKit

class scoreViewController: UIViewController {
    
/***************************************************************************************
 * Variable Declarations and Outlets.
 ***************************************************************************************/
    // Text to go with each possible score.
    let score0 = "SHAME, SHAME, SHAME!";
    let score1 = "You're About As Clever As Hot Pie, SHAME...";
    let score2 = "Maybe You Should Make Your Way Back To The Citadel.";
    let score3 = "Not Perfect But You Know Your Westeros";
    let score4 = "Incredible, You're A Game of Thrones Genius!";
    
    // Outlet to score (int).
    @IBOutlet var scoreLabel: UILabel!
    // Outlet to score description (String).
    @IBOutlet var scoreDesc: UILabel!
    // Used for styling the button.
    @IBOutlet var restartButtonOutlet: [UIButton]!
    
    
    // Restart button used to reset the score and go back to the first question.
    @IBAction func restartButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mainMenu", sender: self)
        score = 0;
    }
    
/*****************************************************************************************
 * Function name : viewDidLoad()
 *    returns : N/A
 *    arg1 : N/A
 * Created by : Kieran Foley
 * Date created : 03/08/2017
 * Date last modified : 12/08/17
 * Description :
 *  Displays the users total score and some text to go along side it, depending on the
 *  total. This function is called once the view has loaded.
 *****************************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text! = String(score) + "/6";
        
        if(score == 0) {
            scoreDesc.text = score0;
        } else if (score == 1) {
            scoreDesc.text = score1;
        } else if (score == 2) {
            scoreDesc.text = score2;
        } else if (score == 3) {
            scoreDesc.text = score3;
        } else if (score == 4) {
            scoreDesc.text = score4;
        }
        // Style the restart button.
        for button in self.restartButtonOutlet {
            button.layer.borderWidth = 4;
            button.layer.cornerRadius = 5;
            button.layer.borderColor = UIColor.lightGray.cgColor;
            button.setTitleColor(UIColor.white, for: .normal);
            button.backgroundColor = UIColor.clear;
            button.setTitle("Main Menu", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
