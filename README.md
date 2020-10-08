# Sensyne Test
* Developed in Xcode version 12
* No 3rd party libraries used
* MVVM architecture
* Unit and UI tests included

## Description
App shows a list of hospitals that can be found in remote CSV file at following URL: http://media.nhschoices.nhs.uk/data/foi/Hospital.csv. If remote file cannot be found, app defaults to local Hospital.csv file included in the budle.  
List can be filtered to show only NHS hospitals.  
Touching on a hospital opens its details like address and location on a map.

## Unit Testing
Unit test is provided to test service that fetches and parses CSV file.

## UI Testing
UI tests include app start test and opening of hospital details screen when a hospital in hospital list is touched.

## To Run
1. Open "SensyneTechTest.xcodeproj" in Xcode
2. Push play button and wait for the app to start
