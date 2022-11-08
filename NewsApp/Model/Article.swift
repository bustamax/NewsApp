//
//  Article.swift
//  NewsApp
//
//  Created by Максим Юрисов on 19.10.2022.
//

import Foundation
/*
"articles": [
-{
-"source": {
"id": null,
"name": "Seeking Alpha"
},
"author": "SA Transcripts",
"title": "Atlas Copco AB (ATLKY) Q3 2022 Earnings Call Transcript",
"description": "Atlas Copco AB (OTCPK:ATLKY) Q3 2022 Earnings Conference Call October 19, 2022 8:00 AM ETCompany ParticipantsMats Rahmström - President and CEOPeter Kinnart - CFOConference Call...",
"url": "https://seekingalpha.com/article/4547544-atlas-copco-ab-atlky-q3-2022-earnings-call-transcript",
"urlToImage": "https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png",
"publishedAt": "2022-10-19T17:33:04Z",
"content": "Atlas Copco AB (OTCPK:ATLKY) Q3 2022 Earnings Conference Call October 19, 2022 8:00 AM ET\r\n Company Participants\r\n Mats Rahmström - President and CEO\r\n Peter Kinnart - CFO\r\n Conference Call Participa… [+48623 chars]"
},
*/
struct Article{
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    init(dictionary: Dictionary<String, Any>){
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
       
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
        
    }
}
