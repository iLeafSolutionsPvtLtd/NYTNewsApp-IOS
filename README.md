# NYTNewsApp-IOS

A simple app to hit the NY Times Most Popular Articles API and:
* Show a list of articles newest first(sorted based on date)
* Shows details when items on the list are tapped. 
* Show Cached articles if network not available
* App supports multiple window


We'll are using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 
For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period

This is configurable in Constants.Swift file in Project. 
We used MVVM Design pattern and swift generic approach to develop this application.

## Code coverage report 

To see the code coverage report, open the Report Navigator on the left, select the report for the last test run, and open the Coverage tab at the top. swift is completely covered by the unit tests we wrote.

<kbd >
<img src="https://github.com/iLeafSolutionsPvtLtd/NYTNewsApp-IOS/blob/main/Piolet-Task/NYTestApp/coverageUpdated.png" width="80%" height="80%">
</kbd>

## Tools And Resources Used

- [Package](https://developer.apple.com/documentation/swift_packages) - Swift Package Manager, or SPM, lets you manage your project dependencies, allowing you to import libraries into your applications with ease.

## Package Used
- [Kingfisher](https://github.com/onevcat/Kingfisher) - This library provides an async image downloader with cache support.
- [ReachabilitySwift ](https://github.com/ashleymills/Reachability.swift) - Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.


# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependency Kingfisher or ReachabilitySwift then do following steps  File -> Package -> Resolve Package versions 
* Press run icon in Xcode or command + R to run the project on Simulator

## Running The Tests Manually 

Follow the steps to get test case reports:
* Enable coverage Data under test schema section:
* Select the Test Icon by pressing and holding Xcode Run Icon OR press `Command+Control+U`
* In the Project Navigator under Test Navigator tab, check test status and coverage 

# Architecture

 MVVM 
