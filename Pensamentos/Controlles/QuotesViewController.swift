//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Marcio Abrantes on 12/08/22.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBackground: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAutor: UILabel!
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    
    let quotesManager = QuoteManager()
    var timer: Timer?
    let configuration = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationManager.shared.add(name: "Refresh") { [weak self] in
            guard let self = self else { return }
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    private func formatView() {
        let isZeroColorScheme = configuration.colorScheme == 0
        view.backgroundColor = isZeroColorScheme ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbQuote.textColor = isZeroColorScheme ? .black : .white
        lbAutor.textColor = isZeroColorScheme ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote() {
        setTimeSchedule()
        showRandomQuote()
    }
    
    func setTimeSchedule() {
        guard configuration.autoRefresh else {
            return
        }
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: configuration.timeInterval, repeats: true) { (timer) in
            self.showRandomQuote()
        }
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        lbQuote.text = quote.quote
        lbAutor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBackground.image = ivPhoto.image
        
        setAlphaInit()
        lcTop.constant = 50
        view.layoutIfNeeded()
        animateUI()
    }
    
    func setAlphaInit() {
        lbQuote.alpha = 0.0
        lbAutor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBackground.alpha = 0.0
    }
    
    func setAlphaAnimated() {
        lbQuote.alpha = 1.0
        lbAutor.alpha = 1.0
        ivPhoto.alpha = 1.0
        ivPhotoBackground.alpha = 1.0
    }
    
    func animateUI() {
        UIView.animate(withDuration: 2.5) {
            self.setAlphaAnimated()
            self.lcTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }

}
