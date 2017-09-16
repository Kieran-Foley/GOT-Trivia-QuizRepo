import UIKit

// Global variable for score :(
var score = 0;

class quizViewController: UIViewController {
/***************************************************************************************
*  Variable Declarations and Outlets.
***************************************************************************************/
    
    // Array for all questions.
    var questions = ["Where do the Lannisters call home?", "What relation does Daenerys have to Jon Snow?", "What is the name of Arya Starks direwolf?", "Who does Oberyn Martell accuse The Mountain of killing?", "Who was responsible for the killing of Jeoffrey Baratheon?", "Who gave Arya Stark her first sword?"]
    
    var answers = [["Casterly Rock", "Iron Islands", "Dorne", "Bear Island"], ["Auntie", "Sister", "Mother", "Cousin"], ["Nymeria", "Lady", "Ghost", "Sansa"], ["Elia Martell", "Lyanna Stark", "Ellaria Sand", "Tyrene Sand"], ["Ollena Tyrell", "Tyrion Lannister", "Sansa Stark", "Arya Stark"], ["Jon Snow", "Ned Stark", "Brienne of Tarth", "Robb Stark"]]
    
    // Acts as a counter to move to the next questions and to find the end of the array.
    var currentQuestion = 0;
    // Random no. (1-4) to change around where the right answer is located.
    var rightAnswerPlacement:UInt32 = 0;

    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var goBackOutlet: UIButton!
    
    @IBOutlet var triviaOutlet: UIButton!
    
    @IBAction func goBackButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mainMenu", sender: self)
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
    
    // Function to move to the trivia viewController.
    func triviaSegue() {
        performSegue(withIdentifier: "triviaSegue", sender: self)
    }
    
/*****************************************************************************************
* Function name : answerButtons()
*    returns : N/A
*    arg1 : button sender
* Created by : Kieran Foley
* Date created : 02/08/2017
* Date last modified : 12/08/17
* Description :
* This function connects all buttons and works out if the user has clicked on the correct
* answer or not, if so, increasing the score variable by 1. It uses unique tags placed on
* each button. It also checks to see if the user has reached the max amount of questions
* (equal to the question array) and then moves to the score view controller.
*****************************************************************************************/
    
    
    
    @IBAction func answerButtons(_ sender: UIButton) {
        
        // If the tag of the button the user clicks on equals the right answer placement.
        // Right Answer.
        if (sender.tag == Int(rightAnswerPlacement)) {
            print("right")
            score += 1;
            // Wrong answer.
        }else {
            print("Wrong")
        }
        // Testing if the current question is not equal to the length of array. (Don't call on something that doesnt exist).
        if (currentQuestion != questions.count) {
            newQuestion()
        }
            //To go onto a new view controller to show score.
        else {
            performSegue(withIdentifier: "scoreView", sender: self)
            print(score)
        }
    }
    
    
    func newQuestion() {
        // Display questions.
        questionLabel.text = questions[currentQuestion]
        
        // Assigned a random no. to the variable (1-4)
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        // Create a button
        var button:UIButton = UIButton()
        // X is used as a counter to loop through all the answers for each question.
        var x = 1;
        // The loop to assign every answer for each question to a button.
        for i in 1...4 {
            // Create a button.
            button = view.viewWithTag(i) as! UIButton
            
            button.layer.cornerRadius = 5;
            button.backgroundColor = UIColor.clear;
            button.layer.borderWidth = 4;
            button.layer.borderColor = UIColor.lightGray.cgColor;
            button.setTitleColor(UIColor.white, for: .normal)
            
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x+=1;
            }
        }
        // Moves to the next question.
        currentQuestion += 1;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        
        goBackOutlet.layer.cornerRadius = 5;
        goBackOutlet.backgroundColor = UIColor.clear;
        goBackOutlet.layer.borderWidth = 4;
        goBackOutlet.layer.borderColor = UIColor.lightGray.cgColor;
        goBackOutlet.setTitleColor(UIColor.white, for: .normal)
        goBackOutlet.setTitle("Main Menu", for: .normal)
        
        triviaOutlet.layer.cornerRadius = 5;
        triviaOutlet.backgroundColor = UIColor.clear;
        triviaOutlet.layer.borderWidth = 4;
        triviaOutlet.layer.borderColor = UIColor.lightGray.cgColor;
        triviaOutlet.setTitleColor(UIColor.white, for: .normal)
        triviaOutlet.setTitle("Trivia", for: .normal)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
