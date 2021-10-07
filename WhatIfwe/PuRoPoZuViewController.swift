
import UIKit
import GameplayKit

class PuRoPoZuViewController: UIViewController
{
    //背景圖片
    @IBOutlet var BackGroundImage: UIImageView!
    //四個密碼textField
    @IBOutlet var GuessNumTextField: [UITextField]!
    //顯示AB TextView
    @IBOutlet weak var ABTextView: UITextView!
    //提示訊息label
    @IBOutlet weak var TipLabel: UILabel!
    //開始按鈕
    @IBOutlet weak var GoButton: UIButton!
    //猜猜看按鈕
    @IBOutlet weak var TryButton:
        UIButton!
    //再玩一次按紐
    @IBOutlet weak var AgainButton: UIButton!
    //花朵圖案圖片
    @IBOutlet weak var FlowerImage: UIImageView!
    //男人圖案圖片
    @IBOutlet weak var MenImage: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       Reset()
      
      
    }
    //正確答案
    var CurrectAnswer : [String] = ["","","",""]
    //次數
    var NumberOfTimes = 0
    //使用者輸入的答案
    var Enter = ""
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

    //初始化
    func Reset()
    {
        for i in 0...3
    {
            //TextField四格出現問號並且不能編輯
        GuessNumTextField[i].placeholder = "?"
        GuessNumTextField[i].text = ""
        GuessNumTextField[i].isEnabled = false
    }
    //隨機號碼
    RandomAnswer()
   //背景初始化
    BackGroundImage.image = UIImage(named: "shop")
   //人物初始化
    MenImage.image = UIImage(named: "Men")
   //花朵初始化
    FlowerImage.image = UIImage(named: "Hantaba")
    //GO.Try按鍵顯示 Again按鍵藏起來
    GoButton.isHidden = false
    TryButton.isHidden = false
    AgainButton.isHidden = true
    //提示訊息為:開始求婚吧！
    TipLabel.text = "プロポーズしよ！！"
    //TextView 清空
    ABTextView.text = ""
    }
    
    
    
    
  
  // 開始遊戲
    @IBAction func GoButtonAction(_ sender: UIButton)
    {
        for i in 0...3
        {   //TextField四格出現00並且能編輯
            GuessNumTextField[i].placeholder = "0"
            GuessNumTextField[i].isEnabled = true
            
        }
        //GO.Try按鍵顯示 Again.GO按鍵藏起來
        GoButton.isHidden = true
        TryButton.isHidden = false
        AgainButton.isHidden = true
       
    }
    
    //驗算
    @IBAction func TryButtonAction(_ sender: UIButton)
    {
        //初始AB為0
        var A = 0
        var B = 0
        
        for i in 0...3
        {    //數字正確位置正確
            if CurrectAnswer[i] == GuessNumTextField[i].text
            {
                A += 1
            }
            //數字正確位置不正確
            else if  CurrectAnswer.contains(GuessNumTextField[i].text!)
            {
                B += 1
            }
            //Enter為出現輸入者所打的數字
            Enter.append(GuessNumTextField[i].text!)
            //text提示文字及文字為空格
            GuessNumTextField[i].placeholder = ""
            GuessNumTextField[i].text = ""
          
        }
        //當4Ａ時
      if A == 4
      {
        //Again按鍵出現
        AgainButton.isHidden = false
        //Try按鍵隱藏
        TryButton.isHidden = true
        //提示訊息為：恭喜結婚
        TipLabel.text = "ご結婚おめでとうございます"
        //人物更換
        MenImage.image = UIImage(named: "MenWedding")
        //背景更換
        BackGroundImage.image = UIImage(named: "Wedding")
        //花朵圖片隱藏
        FlowerImage.isHidden = true
        //TextView顯示 \r\n為換行
        ABTextView.text += "[ \(NumberOfTimes) ]: \(Enter).  \(A)A\(B)B\r\n"
      }
      //當３Ａ時
      else if A == 3
    {   //猜的次數+1
        NumberOfTimes += 1
        //TextView顯示 \r\n為換行
        ABTextView.text += "[ \(NumberOfTimes) ]: \(Enter).  \(A)A\(B)B\r\n"
        //提示訊息為：再加油一下下
        TipLabel.text = "もう少し頑張ります"
        //花朵圖片為顯示並且更改為捧花
        FlowerImage.isHidden = false
        FlowerImage.image = UIImage(named: "Hantaba")
        //人物更換
        MenImage.image = UIImage(named: "MenSecond")
    }
      
      else
        {   //猜的次數+1
            NumberOfTimes += 1
            //TextView顯示 \r\n為換行
            ABTextView.text += "[ \(NumberOfTimes) ]:\(Enter)  .\(A)A\(B)B\r\n"
            //提示訊息為：失敗啊
            TipLabel.text = "残念だ！！"
            //人物更換
           MenImage.image = UIImage(named: "cry")
            //花朵圖片更改為心碎
           FlowerImage.image = UIImage(named: "HardLoser")
         //非必要：為了作弊偷看數字多少 ＸＤ
         print(CurrectAnswer)
            
        }
        //更新使用者的猜測數字
        Enter = ""
        //收鍵盤
        self.view.endEditing(true)
       
        
    }
    
  
    
    
    //再來一次
    @IBAction func AgainButtonAction(_ sender: UIButton)
    {
        Reset()
    }
    
    
}
