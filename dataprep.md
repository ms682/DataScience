### Violations Dataset
* Record Hierarchy
  * Restaurants have many inspections across several dates, count of inspection/restaurant varies
  * Inspections have many violations
  * Each violation has a risk ranking (verify that each vilolation has one risk label of LOW, MED, HIGH)
* For each restaurant, bring only the most recent inspection row to new collapsed training dataset
* Create a new flag “Did most recent inspection have a medium / high violation” = Yes, No
  * For "Did most recent inspection have a medium / high violation” flag = Yes
	   1) look at most recent inspection
	   2) check if it had medium or high violation
	   3) set flag as Yes
  * If most recent inspection had no violation data, categorize flag as “No"
  * If most recent inspection had low risk violations categorize flag as “No” (will likely not be perceived by customers who review on Yelp)   
* Need to create a unique ID per restaurant in violations dataset

### Yelp Dataset
* To predict a violation *will* occur, we can only consider data that are available prior to the date of the inspection in which the violation was identified 
* Most features will need to engineered e.g., counts of each level of start rating, # of reviews. #of tips, etc.
* n-gram extraction or bag of words? Performance and interpretability tradeoffs
  
### Both Datasets
* Capture in violations dataset date of last inspection then only look at Yelp reviews prior to that date
* One row per violation. Need to consolidate multiple records per restaurant to one record per restaurant
* Identify key "lazy" features that we don't have to prep and use these in a logreg model for baseline performance
