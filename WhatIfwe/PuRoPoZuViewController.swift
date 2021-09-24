
import UIKit
import GameplayKit

class PuRoPoZuViewController: UIViewController
{
 //四個密碼textField
    @IBOutlet var GuessNumTextField: [UITextField]!
    //顯示AB TextView
    @IBOutlet weak var ABTextView: UITextView!
    //提示訊息label
    @IBOutlet weak var TipLabel: UILabel!
    //開始按鈕
    @IBOutlet weak var GoButton: UIButton!
    //再一次按鈕
    @IBOutlet weak var AgainButton:
        UIButton!
    //花朵圖案圖片
    @IBOutlet weak var FlowerImage: UIImageView!
    //男人圖案圖片
    @IBOutlet weak var MenImage: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

      
    }
    //正確答案
    var CurrectAnswer : [String] = ["","","",""]
    //機會
    var Chance = 0
    //隨機數字
    func RandomAnswer()
    {
        let RandomNum = GKShuffledDistribution(lowestValue: 0, highestValue: 9)
        //四個textField都要隨機
        for i in 0...3
        {
            CurrectAnswer[i] = "\(RandomNum.nextInt())"
        }
    }


    
    
}
