import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var quiz_Button_Outlet: UIButton!
    @IBOutlet var trivia_Button_Outlet: UIButton!
    @IBOutlet var Polls: UIButton!
   
    
    @IBAction func Quiz_Button(_ sender: UIButton) {
        performSegue(withIdentifier: "quizSegue", sender: self)
    }
    
    
    @IBAction func triviaButton(_ sender: UIButton) {
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
        Polls.setTitle("Don't Click me", for: .normal);
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
*    * Spoiler alert before trivia
***************************************************************************************/
}

