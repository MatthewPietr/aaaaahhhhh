//
//  ViewController.swift
//  aaaaahhhhh
//
//  Created by Matthew Pietrucha on 10/29/20.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var summaryTextView: UITextView!
    
    var detailItem: Entry? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nav = self.navigationController?.navigationBar
        
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red:245/255, green: 196/255, blue: 72/255, alpha: 1)
        title = detailItem?.name
        
        configureView()
    }
    
    func configureView() {
        if let entry = detailItem {
            
            
            //topview
            
            //URGENT GET IMAGE
            if let thisMediaImage = mediaImage {
                //do thing
                
                let url = URL(string: entry.imageURL)
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                thisMediaImage.image = UIImage(data: data!)
                
            }
            
            if let thisTitleLabel = titleLabel {
                thisTitleLabel.text = entry.name
                
            }
            if let thisYearLabel = yearLabel {
                //ADD IN EXTRA IF THERE IS ANY
                if(entry.yearEnd == nil) {
                    thisYearLabel.text = entry.yearStart
                    
                }else if(entry.yearEnd == " - ")
                {
                    thisYearLabel.text = entry.yearStart
                    thisYearLabel.text! += " - "
                }
                else {
                    thisYearLabel.text = entry.yearStart
                    thisYearLabel.text! += " - "
                    thisYearLabel.text! += entry.yearEnd!
                }
                
            }
            
            if let thisFormatLabel = formatLabel {
                thisFormatLabel.text = entry.format
            }
            
            if let thisEpisodeLabel = episodeLabel {
                
                if let episodeCount = entry.episodes {
                    if(episodeCount == 1)
                    {
                        thisEpisodeLabel.text = "\(episodeCount) Episode"
                        
                    }
                    else{
                        thisEpisodeLabel.text = "\(episodeCount) Episodes"
                        
                    }
                    
                } else {
                    thisEpisodeLabel.text = ""
                }
            }
            
            if let thisStudioLabel = studioLabel {
                thisStudioLabel.text = entry.studio
            }
            
            //bottomview
            if let thisDescriptionLabel = descriptionLabel {
                thisDescriptionLabel.text = entry.description
            }
            
            if let thisSummaryTextView = summaryTextView {
                thisSummaryTextView.text = entry.summary
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCastList" {

            let controller = segue.destination as! CastTableViewController
            controller.castListArray = detailItem?.starring
                
            
        }
    }

    //ha
}

