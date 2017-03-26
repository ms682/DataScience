# Team 13 Data Science Project - Predicting Health Code Violations from Yelp Data :crystal_ball:

### Important Links
[Yelp Dataset Download](https://www.yelp.com/dataset_challenge/dataset)  
[Pittsburgh Health Violation Data](https://data.wprdc.org/dataset/allegheny-county-restaurant-food-facility-inspection-violations/resource/1a1329e2-418c-4bd3-af2c-cc334e7559af)  
[Yelp Dataset Examples](https://github.com/Yelp/dataset-examples)  
[postgreSQL](http://postgresapp.com/)  

### Amazon RDS PostgreSQL Endpoint
 To connect to the project database, you will need to install a postgresql client, suchh as [pgAdmin](https://www.pgadmin.org/). 
 
 #### Database Connection  
 Create a new server with the following parameters:  
    **Hostname:** [sterndsyelp.cawzspvmqd5q.us-east-1.rds.amazonaws.com](sterndsyelp.cawzspvmqd5q.us-east-1.rds.amazonaws.com)  
    **Port:** 5432  
    **User:** mvsternds  
    
#### Tables & Views
There are 5 tables and two views in the database.
 * business 
 * checkin
 * reviews
 * tips
 * violations
 * restaurants (view) - materialized view of the *business* table with the following definition. (Work in progress)
  ```sql
   SELECT btrim(ltrim(b.state, 'b'::text), ''''::text) AS state,
    b.hours,
    btrim(ltrim(b.type, 'b'::text), ''''::text) AS type,
    b.review_count,
    btrim(ltrim(b.neighborhood, 'b'::text), ''''::text) AS neighborhood,
    b.latitude,
    b.is_open,
    b.attributes,
    btrim(ltrim(b.name, 'b'::text), ''''::text) AS name,
    btrim(ltrim(b.address, 'b'::text), ''''::text) AS address,
    btrim(ltrim(b.city, 'b'::text), ''''::text) AS city,
    b.longitude,
    b.categories,
    btrim(ltrim(b.postal_code, 'b'::text), ''''::text) AS postal_code,
    btrim(ltrim(b.business_id, 'b'::text), ''''::text) AS business_id,
    b.stars
   FROM business b
   WHERE (upper(b.categories) ~~ '%RESTAURANTS%'::text 
   OR upper(b.categories) ~~ '%FOOD%'::text)
   AND b.state ~~ '%PA%'::text;
  ```
 * rest_vltns - materialized view of the *business* table inner joined to the *violaitons* table, with some cleaning of the data.
 
```sql
select A.business_id, btrim( A.name, '"') as name, A.categories, A.attributes, A.hours, A.stars, A.review_count, A.is_open,  A.longitude, A.latitude, A.address, A.city, A.postal_code, A.neighborhood, b._id, b.facility_name, b.encounter, b.id, b.placard_st, b.bus_st_date, b.inspect_dt, b.start_time, b.end_time, b.description, b.num ||' '|| b.street as b_address, b.city,  b.rating, b.description_new, b.low, b.medium, b.high
from restaurants A
inner join public.violations b
on levenshtein(btrim( a.name,'"'), b.facility_name) <3
and trim(a.postal_code) = trim(b.zip)
and levenshtein(a.address, b.num ||' '|| b.street) <4;
```
### Data Dictionaries
[Pittsburgh Health Code Violations Data Dictionary](https://data.wprdc.org/dataset/allegheny-county-restaurant-food-facility-inspection-violations/resource/4b4588dd-86f1-478a-bca5-298dfe8eb9d1)

#### yelp_academic_dataset_business.json
 ```json
{
    "business_id":"encrypted business id",
    "name":"business name",
    "neighborhood":"hood name",
    "address":"full address",
    "city":"city",
    "state":"state -- if applicable --",
    "postal code":"postal code",
    "latitude":latitude,
    "longitude":longitude,
    "stars":star rating, rounded to half-stars,
    "review_count":number of reviews,
    "is_open":0/1 (closed/open),
    "attributes":["an array of strings: each array element is an attribute"],
    "categories":["an array of strings of business categories"],
    "hours":["an array of strings of business hours"],
    "type": "business"
}
```

#### yelp_academic_dataset_review.json
```json
{
    "review_id":"encrypted review id",
    "user_id":"encrypted user id",
    "business_id":"encrypted business id",
    "stars":star rating, rounded to half-stars,
    "date":"date formatted like 2009-12-19",
    "text":"review text",
    "useful":number of useful votes received,
    "funny":number of funny votes received,
    "cool": number of cool review votes received,
    "type": "review"
}
```
#### yelp_academic_dataset_user.json
```json
{
    "user_id":"encrypted user id",
    "name":"first name",
    "review_count":number of reviews,
    "yelping_since": date formatted like "2009-12-19",
    "friends":["an array of encrypted ids of friends"],
    "useful":"number of useful votes sent by the user",
    "funny":"number of funny votes sent by the user",
    "cool":"number of cool votes sent by the user",
    "fans":"number of fans the user has",
    "elite":["an array of years the user was elite"],
    "average_stars":floating point average like 4.31,
    "compliment_hot":number of hot compliments received by the user,
    "compliment_more":number of more compliments received by the user,
    "compliment_profile": number of profile compliments received by the user,
    "compliment_cute": number of cute compliments received by the user,
    "compliment_list": number of list compliments received by the user,
    "compliment_note": number of note compliments received by the user,
    "compliment_plain": number of plain compliments received by the user,
    "compliment_cool": number of cool compliments received by the user,
    "compliment_funny": number of funny compliments received by the user,
    "compliment_writer": number of writer compliments received by the user,
    "compliment_photos": number of photo compliments received by the user,
    "type":"user"
}
```
#### yelp_academic_dataset_checkin.json
```json 
{
    "time":["an array of check ins with the format day-hour:number of check ins from hour to hour+1"],
    "business_id":"encrypted business id",
    "type":"checkin"
}
```
#### yelp_academic_dataset_tip.json
```json
{
    "text":"text of the tip",
    "date":"date formatted like 2009-12-19",
    "likes":compliment count,
    "business_id":"encrypted business id",
    "user_id":"encrypted user id",
    "type":"tip"
}
```
:+1:


