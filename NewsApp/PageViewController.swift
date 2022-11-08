//
//  PageViewController.swift
//  NewsApp
//
//  Created by Максим Юрисов on 21.10.2022.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        self.showVC()
        loadNews {
            self.showVC()
        }
       
    }
    
    @IBAction func refreshItem(_ sender: Any) {
        loadNews {
            self.showVC()
        }
    }
    
    func showVC(){
        DispatchQueue.main.async {
            if let vc = self.pageViewController(for: 0){
            
                self.setViewControllers([vc], direction: .forward, animated: false)
                
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = ((viewController as? OneNewsController)?.index ?? 0) - 1
        
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? OneNewsController)?.index ?? 0) + 1
        
        return self.pageViewController(for: index)
    }

    func pageViewController(for index:Int) -> OneNewsController?{
        if index < 0 {
           return nil
        }
        if index >= articles.count{
            return nil
        }
       let vc =  (storyboard?.instantiateViewController(withIdentifier: "oneNewsSID")) as! OneNewsController
        vc.article = articles[index]
        vc.index = index
        return vc
        
    }

}
