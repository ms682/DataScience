# Team 13 Data Science Project - Predicting Inspection Violations from Yelp Data  :crystal_ball:

 ### Important Notes
  1. We are working with the Toronto [Yelp](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjy9KmS0MDTAhWD44MKHd6LBfcQFgglMAA&url=https%3A%2F%2Fwww.yelp.com%2Fdataset_challenge&usg=AFQjCNGnTkUSU1hQghw6jiTs_WSz6_4eXQ&sig2=lm7x5yMFkVWyTIcQ3W17Sg) data and the [Toronto Restaurant Inspection](http://www.toronto.ca/health/dinesafe/) Datasets
  2. The current working notebook is [yelp-toronto-dataset.ipynb](https://github.com/ms682/DataScience/blob/master/yelp-toronto-dataset.ipynb)
  3. Within the notebook, [Levenshtein Option #3](https://render.githubusercontent.com/view/ipynb?commit=3d5ccd48d043d08780689d25bbd37d161fd65f48&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f6d733638322f44617461536369656e63652f336435636364343864303433643038373830363839643235626264333764313631666436356634382f79656c702d746f726f6e746f2d646174617365742e6970796e62&nwo=ms682%2FDataScience&path=yelp-toronto-dataset.ipynb&repository_id=86007046#Levenshtein-Option-#3-(in-database)) has a working view of the Yelp data joined with the inspection data
*Note that we still need to combine records in this dataset where the inepsction date and business ID are the same*
 ID 
 ### To Do
 1. Add column headers from postgres :heavy_check_mark:
 2. Clean review text stop words :heavy_check_mark:
 3. Merge records where the inspeciton date and bizID are the same and make aggegate features :heavy_check_mark:
 4. Extract attrbutes column into features - Michelle 
 5. Engineer other features
 6. n-gram vectorization and extraction (after removal of stop words)
 7. train/test split
 8. Model Selection, training, and testing (repeat as needed)
 9. Report Writeup - Michelle (started)
