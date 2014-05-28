class SpellingController < UIViewController
  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewDidLoad
    super
    url = "file://#{NSBundle.mainBundle.pathForResource "ui", ofType: "html"}".stringByAddingPercentEncodingWithAllowedCharacters NSCharacterSet.URLQueryAllowedCharacterSet
    request = NSURLRequest.requestWithURL(NSURL.URLWithString(url))
    view.delegate = self
    view.loadRequest request
  end

  def prefersStatusBarHidden
    true
  end

  def webView(webView, shouldStartLoadWithRequest: request, navigationType: navigationType)
    scheme = request.URL.scheme
    return true unless scheme == "spellchecker"
    @text = webView.stringByEvaluatingJavaScriptFromString "document.getElementById(\"input\").value"
    @errors = WebService.validateText(@text).join(",\n")
    UIAlertView.alloc.initWithTitle("Spelling errors found", message: @errors, delegate: self, cancelButtonTitle: "OK", otherButtonTitles: nil).show unless @errors.size == 0
    false
  end

end