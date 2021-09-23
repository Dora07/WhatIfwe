
import UIKit

class KokuHakuViewController: UIViewController
{
   //填入的數字
    @IBOutlet weak var InPutNumber: UITextField!
    //提示
    @IBOutlet weak var TipLabel: UILabel!
    //能猜次數
    @IBOutlet weak var GuessTime: UILabel!
    //情侶圖片
    @IBOutlet weak var LoverImage: UIImageView!
    //開始按鍵
    @IBOutlet weak var GoButton: UIButton!
    
    //答案初始值
    var CurrectAnswer = 0
    //能猜次數總數五次
    var Chance = 5
    //最大數字及最小數字
    var TopNumber = 50
    var LeastNumber = 0
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       //自動產生0-50之間亂數的函式
        CurrectAnswer =  Int(arc4random_uniform(50))
        
    }
    

    //開始按鈕
    @IBAction func GoButtonAction(_ sender: UIButton)
    {
        //輸入完後收取鍵盤
        InPutNumber.resignFirstResponder()
        
        //狀況一：如果使用者未輸入
        if InPutNumber.text == ""
        {   //提示：她在等你回答呢
            TipLabel.text = "返事を待っている"
        }
        //狀況二：使用者不是輸入輸字
        else if Int(InPutNumber.text!) == nil
        {    //提示：填數字！！
            TipLabel.text = "数字を書いてください！"
        }
        //狀況三：能猜次數還沒用完就驗算他的數字正確嗎
        else if  Chance > 0
        {   //驗算
            let UserAnswer = Int(InPutNumber.text!)!
            CheckNumber(test: UserAnswer)
        
            
        }
        //狀態四：次數用完發出收到好人卡並且隱藏goButton
        else
        {   //提示：恭喜你收到義理巧克力（好人卡）
            TipLabel.text = "義理チョコレートをもらった"
            GoButton.isHidden = true
            LoverImage.image = UIImage(named: "EasyLoser")
        }
             
            
        
        
    }
    
    
    //提示數字是多少到多少
    func GetNumberRange() -> String
    {
        return"(\(LeastNumber)~\(TopNumber))"
    }
   
    //驗算
    func CheckNumber (test:Int)
    {    //狀況一：猜的數字大於50，猜出數字範圍
        if test > 50
        {  //提示：班上人數是多少到多少喔
            TipLabel.text = "クラスの学生数は\(GetNumberRange())"
           //機會叩一
            Chance -= 1
            //機會提示剩幾次
            GuessTime.text = "残り\(Chance)回"
        } //狀況二：猜的數字大於答案時
        else if test > CurrectAnswer
            
        {   //提示最大數字為答案-1
            TopNumber = test - 1
            //提示：太多了
                TipLabel.text = "多いね\(GetNumberRange())"
            //機會叩一
             Chance -= 1
            //機會提示剩幾次
            GuessTime.text = "残り\(Chance)回"
        }//狀況三：猜的數字小於答案時
        else if test < CurrectAnswer
        {    //提示最小數字為答案+1
            LeastNumber = test + 1
            //提示：太少了
                TipLabel.text = "少ないね\(GetNumberRange())"
            //機會叩一
             Chance -= 1
            //機會提示剩幾次
            GuessTime.text = "残り\(Chance)回"
        }//狀況四：答對了！
       else
        {  //提示：答對了！！女生座號對了開始交往了呢
            TipLabel.text = "正解！彼女は\(GetNumberRange())付き合い始める"
            //變更圖片為情侶勾手
            LoverImage.image = UIImage(named: "coupleschool")
        }
    }
    
    

}
