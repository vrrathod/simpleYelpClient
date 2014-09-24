simpleYelpClient
================

It's a simple yelp client.
*) Search results page:<br/>
<br/>
[done]1. Table rows should be dynamic height according to the content height<br/>
[done]2. Custom cells should have the proper Auto Layout constraints <br/>
[done]3. Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does). <br/>
Optional: infinite scroll for restaurant results<br/>
Optional: Implement map view of restaurant results<br/>
<br/>
*) Filter page: Unfortunately, not all the filters are supported in the Yelp API.<br/>
The filters you should actually have are: <br/>
1. category, <br/>
   Categories should show a subset of the full list with a "See All" row to expand.<br/>
   Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)<br/>
[done] 2. sort (best match, distance, highest rated), <br/>
[done] 3. radius (meters), Radius filter should expand as in the real Yelp app<br/>
[done] 4. deals (on/off). You can use the default UISwitch for on/off states. Optional: implement a custom switch<br/>
The filters table should be organized into sections as in the mock.<br/>
<br/>
[done] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.<br/>
Optional: Implement the restaurant detail page.<br/>
