//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
        var urlDownloader = URLDownloader()
        urlDownloader.getPosts()
        
        
    }
    
}

struct Post: Codable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
}

class URLDownloader {
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
        
            guard let data = data else {
                
                print("Error: No data")
                return
                
            }
            
            guard error == nil else {
                
                print("Error: \(String(describing: error))")
                return
                
            }

            guard let response = response as? HTTPURLResponse else {
                
                print("Error: Invalid response")
                return
                
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                
                print("Error, response code: \(response.statusCode)")
                return
                
            }

            print("Data downloaded successfully")
            print(data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
        }.resume()
            
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
