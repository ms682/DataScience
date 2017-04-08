### Violations Dataset
  * Record Hierarchy
   * Restaurants have many inspections across several dates, count of inspection/restaurant varies
   * Which inspection should we use for each restaurant? 
    +Inspections have many violations
    +Each violation has a risk ranking (verify that each vilolation has one risk label of c(LOW, MED, HIGH)
  * Need to combine records from each inspection
  * We will ignore most features in this dataset because we cannot predict a violation from the violation itself, unless we want to featurize informaiton about *prior* violaitons

### Yelp Dataset
  * To predict a violation *will* occur, we can only consider data that are available prior to the date of the inspection in which the violation was identified 
  * Most features will need to engineered e.g., counts of each level of start rating, # of reviews. #of tips, etc.
  * n-gram extraction or bag of words? Performance and interpretability tradeoffs
  
### Both Datasets
  * Need to consolidate multiple records per restaurant to one record per restaurant
  * Identify key "lazy features that we don't have to prep and use these in a logreg model for baseline performance
