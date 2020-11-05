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
    
    var detailItem: Game? {
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
        title = detailItem?.gameName
        
        configureView()
    }
    
    func configureView() {
        if let entry = detailItem {
            
            
            //topview
            
            //URGENT GET IMAGE
            if let thisMediaImage = mediaImage {
                //do thing
                
                let url = URL(string: entry.URLForImage)
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                thisMediaImage.image = UIImage(data: data!)
                
            }
            
            if let thisTitleLabel = titleLabel {
                thisTitleLabel.text = entry.gameName
                
            }
            if let thisYearLabel = yearLabel {
                //ADD IN EXTRA IF THERE IS ANY
                if(entry.yearReleased == nil) {
                    thisYearLabel.text = entry.yearShown
                    
                }else if(entry.yearReleased == " - ")
                {
                    thisYearLabel.text = entry.yearShown
                    thisYearLabel.text! += " - "
                }
                else {
                    thisYearLabel.text = entry.yearShown
                    thisYearLabel.text! += " - "
                    thisYearLabel.text! += entry.yearReleased!
                }
                
            }
            
            if let thisFormatLabel = formatLabel {
                thisFormatLabel.text = entry.type
            }
            
            if let thisEpisodeLabel = episodeLabel {
                
                if let episodeCount = entry.howLongToBeatInHrs {
                    if(episodeCount == 1)
                    {
                        thisEpisodeLabel.text = "\(episodeCount) Hour"
                        
                    }
                    else{
                        thisEpisodeLabel.text = "\(episodeCount) Hours"
                        
                    }
                    
                } else {
                    thisEpisodeLabel.text = ""
                }
            }
            
            if let thisStudioLabel = studioLabel {
                thisStudioLabel.text = entry.gameStudio
            }
            
            //bottomview
            if let thisDescriptionLabel = descriptionLabel {
                thisDescriptionLabel.text = entry.descriptionForGame
            }
            
            if let thisSummaryTextView = summaryTextView {
                thisSummaryTextView.text = entry.summaryForGame
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
            controller.castListArray = detailItem?.voiceActors
                
            
        }
    }

    //ha
}

