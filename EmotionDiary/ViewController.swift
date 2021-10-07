//
//  ViewController.swift
//  EmotionDiary
//
//  Created by KEEN on 2021/10/06.
//

import UIKit

class MainViewController: UIViewController {

  // MARK: UI
  @IBOutlet weak var fineLabel: UILabel!
  @IBOutlet weak var exciteLabel: UILabel!
  @IBOutlet weak var happyLabel: UILabel!
  @IBOutlet weak var madLabel: UILabel!
  @IBOutlet weak var voidLabel: UILabel!
  @IBOutlet weak var relieveLabel: UILabel!
  @IBOutlet weak var anxiousLabel: UILabel!
  @IBOutlet weak var concernLabel: UILabel!
  @IBOutlet weak var sadLabel: UILabel!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
   super.viewDidLoad()
    
    configInitLabel([
      (fineLabel, "괜찮아"), (exciteLabel, "신이나"), (happyLabel, "행복해"),
      (madLabel, "화가나"), (voidLabel, "공허해"), (relieveLabel, "안심돼"),
      (anxiousLabel, "걱정돼"), (concernLabel, "고민돼"), (sadLabel, "눈물나")
    ])
  }
  
  // label 초기화
  func configInitLabel(_ items: [(UILabel, String)]) {
    for item in items {
      let label = item.0
      let key = item.1
      let usrEmotion = UserDefaults.standard.string(forKey: key) ?? "0"
      label.text = "\(key) \(usrEmotion)"
    }
  }

  // userDefaults 초기화
  func initUserDefaults() {
    UserDefaults.standard.set(0, forKey: "괜찮아")
    UserDefaults.standard.set(0, forKey: "신이나")
    UserDefaults.standard.set(0, forKey: "행복해")
    UserDefaults.standard.set(0, forKey: "화가나")
    UserDefaults.standard.set(0, forKey: "공허해")
    UserDefaults.standard.set(0, forKey: "안심돼")
    UserDefaults.standard.set(0, forKey: "걱정돼")
    UserDefaults.standard.set(0, forKey: "고민돼")
    UserDefaults.standard.set(0, forKey: "눈물나")
  }
  
  // 버튼 탭에 따라 label 변경
  func setLabel(_ label: UILabel) {
    guard let text = label.text else { return }
    let key = text.components(separatedBy: " ")[0]
    
    var currentNum = UserDefaults.standard.integer(forKey: key)
    currentNum += 1
    UserDefaults.standard.set(currentNum, forKey: key)
    
    label.text = "\(key) \(currentNum)"
  }
  
  // MARK: Action
  @IBAction func onFine(_ sender: UIButton) {
    setLabel(fineLabel)
  }
  
  @IBAction func onExcited(_ sender: UIButton) {
    setLabel(exciteLabel)
  }
  
  @IBAction func onHappy(_ sender: UIButton) {
    setLabel(happyLabel)
  }
  
  @IBAction func onMad(_ sender: UIButton) {
    setLabel(madLabel)
  }
  
  @IBAction func onVoid(_ sender: UIButton) {
    setLabel(voidLabel)
  }
  
  @IBAction func onRelieved(_ sender: UIButton) {
    setLabel(relieveLabel)
  }
  
  @IBAction func onAnxious(_ sender: UIButton) {
    setLabel(anxiousLabel)
  }
  
  @IBAction func onConcerned(_ sender: UIButton) {
    setLabel(concernLabel)
  }
  
  @IBAction func onSad(_ sender: UIButton) {
    setLabel(sadLabel)
  }
  
  @IBAction func onInitEmotion(_ sender: UIBarButtonItem) {
    initUserDefaults()
    configInitLabel([
      (fineLabel, "괜찮아"), (exciteLabel, "신이나"), (happyLabel, "행복해"),
      (madLabel, "화가나"), (voidLabel, "공허해"), (relieveLabel, "안심돼"),
      (anxiousLabel, "걱정돼"), (concernLabel, "고민돼"), (sadLabel, "눈물나")
    ])
  }
}


