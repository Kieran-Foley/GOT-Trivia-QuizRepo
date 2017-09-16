/***************************************************************************************
 * GOT-Trivia&Quiz.proj:
 *
 * First written on 02/08/2017
 * Last modified on 12/08/2017
 *
 * Author: Kieran Foley
 *
 * Program Name: Game Of Thrones Trivia & Quiz
 *
 * Program Description:
 *  Game of throne facts and trivia with a quiz.
 ***************************************************************************************/

import UIKit

// Global :(
var shownSpoilerAlert = 0;

class ViewController: UIViewController {

/***************************************************************************************
 *  Variable Declarations and Outlets.
 ***************************************************************************************/
    @IBOutlet var quiz_Button_Outlet: UIButton!
    @IBOutlet var trivia_Button_Outlet: UIButton!
    @IBOutlet var Polls: UIButton!
    
    // Function to move to the quiz viewController.
    @IBAction func Quiz_Button(_ sender: UIButton) {
        performSegue(withIdentifier: "quizSegue", sender: self)
    }
    
/*****************************************************************************************
 * Function name : triviaButton()
 *    returns : N/A
 *    arg1 : N/A
 * Created by : Kieran Foley
 * Date created : 10/08/2017
 * Date last modified : 12/08/17
 * Description :
 *  Displays an alert to the user to warn them of possible spoilers, if the user clicks
 *  "cancel" the alert will continue to pop up every time the user clicks on the trivia
 *  button, however if they click continue the alert will be disabled and call the trivia
 *  segue function.
 *****************************************************************************************/
    @IBAction func triviaButton(_ sender: UIButton) {
        if (shownSpoilerAlert == 0) {
            let alert = UIAlertController(title: "Warning!", message: "The next page contains spoilers.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
                self.triviaSegue()
                shownSpoilerAlert = 1;
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.triviaSegue()
        }
    }
 
    // Function to move to the trivia viewController.
    func triviaSegue() {
        performSegue(withIdentifier: "triviaSegue", sender: self)
    }
    
/*****************************************************************************************
 * Function name : viewDidLoad()
 *    returns : N/A
 *    arg1 : N/A
 * Created by : Kieran Foley
 * Date created : 10/08/2017
 * Date last modified : 12/08/17
 * Description :
 *  Styles the appearence and titles of the buttons.
 *****************************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz_Button_Outlet.layer.cornerRadius = 5;
        quiz_Button_Outlet.layer.borderWidth = 4;
        quiz_Button_Outlet.layer.borderColor = UIColor.lightGray.cgColor;
        quiz_Button_Outlet.backgroundColor = UIColor.clear;
        quiz_Button_Outlet.setTitleColor(UIColor.white, for: .normal);
        quiz_Button_Outlet.setTitle("Take The Quiz", for: .normal);
        
        trivia_Button_Outlet.layer.cornerRadius = 5;
        trivia_Button_Outlet.layer.borderWidth = 4;
        trivia_Button_Outlet.layer.borderColor = UIColor.lightGray.cgColor;
        trivia_Button_Outlet.backgroundColor = UIColor.clear;
        trivia_Button_Outlet.setTitleColor(UIColor.white, for: .normal);
        trivia_Button_Outlet.setTitle("Trivia", for: .normal);
        
        Polls.layer.cornerRadius = 5;
        Polls.layer.borderWidth = 4;
        Polls.layer.borderColor = UIColor.lightGray.cgColor;
        Polls.backgroundColor = UIColor.clear;
        Polls.setTitleColor(UIColor.white, for: .normal);
        Polls.setTitle("Coming Soon", for: .normal);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

/***************************************************************************************
* To Do List
*
*    * Add more questions and answers.
*    * Make the questions random, make many so its different every time you try.
*    * Highscores? Would need to implement users.
*    * Comment all views.
***************************************************************************************/
}

