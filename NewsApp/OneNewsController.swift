//
//  OneNewsController.swift
//  NewsApp
//
//  Created by Максим Юрисов on 20.10.2022.
//

import UIKit
import SafariServices

class OneNewsController: UIViewController {

    var index:Int = 0
    var article: Article!
    
    @IBOutlet weak var buttonRead: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBAction func pushRead(_ sender: Any) {
        if let url = URL(string: article.url){
        let svc = SFSafariViewController(url: url)
            present(svc, animated: true)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            // загрузка картинки в отдельном потоке
            if let url = URL(string: self.article.urlToImage){
                if let data = try? Data(contentsOf: url){
                    self.imageView.image = UIImage(data: data)
                    
                }else{
                    self.indicator.isHidden = true
                }
                
            }
            if URL(string: self.article.url) == nil{
                
                self.buttonRead.isHidden = true
            }
            
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
