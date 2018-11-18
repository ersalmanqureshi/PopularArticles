## PopularArticles-NYTimes

This project displays a list of the most popular viewed New York Times articles from the last 7 days. It enables users to view details about each article, and view the full article in Safari.

This app is built with Xcode Version 10.1. Written in Swift 4.

### How to run the Project?

1. Clone this repo
2. Open terminal window and navigate to project folder where Podfile reside
3. Run `pod install --verbose`
4. Open `PopularArticles.xcworkspace` and run the project on real device or simulator

### How test can be run in the Project?

1. Select Product -> Edit Scheme -> Under test section -> Open options -> Select gather coverage data
2. Press Cmd + U to run the test and go to test section from left navigator panel, you will see green badge if test run successfully and red badge if any error
3. For code coverage, Go the last log section from left navigate panel -> click on coverage.

#### Attached below screenshot for reference,

Step 1:

![N|Solid](https://cldup.com/vDV7pPgHti.png)

Step 2:

![N|Solid](https://cldup.com/VTnpRFnwnO.png)

Step 3:

![N|Solid](https://cldup.com/cj4PuFhaeQ.png)


### External Libraries Used:
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
