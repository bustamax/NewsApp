//
//  Model.swift
//  NewsApp
//
//  Created by Максим Юрисов on 19.10.2022.
//

import Foundation

var articles: [Article] {
    
    
    let data = try? Data(contentsOf: urlToData)
     if data == nil {
         return []
     }
   
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
     if rootDictionaryAny == nil{
         return []
     }
     let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
     if rootDictionary == nil{
         return []
     }
     var returnarray: [Article] = []
     if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>]{

         for dict in array{
             let newArticle = Article(dictionary: dict)
             returnarray.append(newArticle)
         }
         return returnarray
         
     }
     

    
    
    return []
}

var urlToData: URL{
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

//https://newsapi.org/v2/everything?q=tesla&from=2022-09-19&sortBy=publishedAt&apiKey=5ac9dddfeeae4975bd9827f3b123ab93

func loadNews(completionHandler:(()->Void)?){
    let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-09-19&sortBy=publishedAt&apiKey=5ac9dddfeeae4975bd9827f3b123ab93")
    
    let session = URLSession(configuration: .default)
    
   let downloadTask =  session.downloadTask(with: url!) { urlFile, responce, error in
       if urlFile != nil {
           // сохраняем загруженный файл
           //куда копировать - в директорию пользователя:
           let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
           let urlPath = URL(fileURLWithPath: path)
           try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
           
           completionHandler?()
  
       }
        
    }
    downloadTask.resume()
}

func parseNews(){

}
