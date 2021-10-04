
import UIKit
import GameplayKit

class PuRoPoZuViewController: UIViewController
{
    //背景圖片
    @IBOutlet var BackGroundView: UIView!
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
        AgainButton.isHidden = true
      
    }
    //正確答案
    var CurrectAnswer : [String] = ["","","",""]
    //機會
    var Chance = 0
    //隨機數字
    func RandomAnswer()
    {
        let RandomNum = GKShuffledDistribution(lowestValue: 0, highestValue: 9)
        
        for i in 0...3
        {
            //四個textField都要隨機
            CurrectAnswer[i] = "\(RandomNum.nextInt())"
        }
    }


    @IBAction func GoButtonAction(_ sender: UIButton)
    {
        var A = 0
        var B = 0
        
        for i in 0...3
        {
            if CurrectAnswer[i] == GuessNumTextField[i].text
            {
                A += 1
            }
            else if CurrectAnswer.contains(GuessNumTextField[i].text!)
            {
                B += 1
            }
            
            AgainButton.isHidden = true
        }
      //4個數字位置都猜對
        if A == 4
        {   //再一次按鈕出現
            AgainButton.isHidden = false
            //Ｇo按鈕隱藏
            GoButton.isHidden = true
            //恭喜文字
            TipLabel.text = "ご結婚おめでとうございます"
            //更改背景跟人物
            MenImage.image = UIImage(named: "MenWedding")
            BackGroundView.largeContentImage = UIImage(named: "Wedding")
            FlowerImage.image = UIImage(named: "HardLoser")
        }
        
       else if A == 3
       {
        Chance += 1
        AgainButton.isHidden = true
        ABTextView.text += "[\(Chance)]:\(A)A\(B)B"
        TipLabel.text = ""
        
       }
        
        
        

    }
    
    
}
