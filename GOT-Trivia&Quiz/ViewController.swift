import UIKit

// Global :(
var shownSpoilerAlert = 0;

class ViewController: UIViewController {

    @IBOutlet var quiz_Button_Outlet: UIButton!
    @IBOutlet var trivia_Button_Outlet: UIButton!
    @IBOutlet var Polls: UIButton!
    
    
    @IBAction func Quiz_Button(_ sender: UIButton) {
        performSegue(withIdentifier: "quizSegue", sender: self)
    }
    
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
 
    func triviaSegue() {
        performSegue(withIdentifier: "triviaSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        // Dispose of any resources that can be recreated.
    }

/***************************************************************************************
* To Do List
*
*    * Add more questions and answers.
*    * Make the questions random, make many so its different every time you try.
*    * Highscores? Would need to implement users.
*    * Comment all views.
*    * Quit button on quiz.
***************************************************************************************/
}

