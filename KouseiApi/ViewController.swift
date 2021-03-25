//
//  ViewController.swift
//  KouseiApi
//
//  Created by 立岡力 on 2021/03/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // AlamofireでAPIリクエストをする
        AF.request("https://qiita.com/api/v2/items")
            // レスポンスをJSON形式で受け取る
            .responseJSON { response in
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    // decode関数の引数にはJSONからマッピングさせたいクラスをと実際のデータを指定する
                    let articles: [Article] = try decoder.decode([Article].self, from: response.data!)
                    print(articles)
                } catch {
                    // JSONの形式とクラスのプロパティが異なっている場合には失敗する
                    print("failed")
                    print(error.localizedDescription)
                }
        }
    }

}

