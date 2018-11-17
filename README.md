## PopularArticles

This project displays a list of the most popular viewed New York Times articles from the last 7 days. It enables users to view details about each article, and view the full article in Safari.

This app built with Xcode Version 10.1. Written in Swift 4.

### How to run the Project?

1. Clone this repo
2. Open terminal window and navigate to project folder where Podfile reside
3. Run `pod install --verbose`
4. Open `PopularArticles.xcworkspace` and run the project on real device or simulator

### External Libraries:
[Moya](https://github.com/Moya/Moya)

[Kingfisher](https://github.com/onevcat/Kingfisher).

### API Details:
* Base URL: http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=#APIKEY
* API-KEY:`b6c94499c2dd459d9aa72d581385d951`
* Example URL: http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=b6c94499c2dd459d9aa72d581385d951
* API Documentation: http://developer.nytimes.com/

### Author
Salman Qureshi, er.salmanqureshi@gmail.com

### License

**PopularArticles** is available under the MIT license. See the LICENSE file for more info.
