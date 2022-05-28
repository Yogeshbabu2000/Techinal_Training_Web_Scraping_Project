#Web Scraping And Data Cleaning,
##Web Scraping of item reviews of an e-commerce website,
###Scrap apple smart watch product reviews in Amazon website

**install Package list**
**rvest helps you scrape information from web pages**
**Provides functions to download and parse 'robots. txt' files. Ultimately the package makes it easy to check if bots (spiders, crawler, scrapers, ...) are allowed to access specific resources on a domain.**
```
install.packages("robotstxt")
install.packages("rvest")
library(robotstxt)
library(rvest)
```

####SCRAPPING WEBSITE LIST

[linked phrase](https://www.amazon.in/s?k=apple+smart+watches+for+men&rh=n%3A976419031%2Cp_89%3AApple&dc&crid=3W07DH8Z6ZI1W&qid=1653596996&rnid=3837712031&sprefix=apple+s%2Caps%2C213&ref=sr_nr_p_89_1)
![alt text](https://www.amazon.in/s?k=apple+smart+watches+for+men&rh=n%3A976419031%2Cp_89%3AApple&dc&crid=3W07DH8Z6ZI1W&qid=1653596996&rnid=3837712031&sprefix=apple+s%2Caps%2C213&ref=sr_nr_p_89_1/logo.png)

```
To convert a website into an XML object, you use the read_html() function,Creates an html document from a url
```
```
page<-read_html(link)
```
```
html_nodes()-Selects parts of a document using css element,html_text()-Extracts text from selected nodes,%>% is called the forward pipe operator in R. It provides a mechanism for chaining commands with a new forward-pipe operator, %>%. This operator will forward a value, or the result of an expression, into the next function call/expression.
```
```
name<-page%>%html_nodes(".s-line-clamp-4")%>%html_text()


price<-page%>%html_nodes(".a-price-whole")%>%html_text()
price_add<-paste("₹",price)

rating_out_of_5<-page%>%html_nodes(".aok-align-bottom")%>%html_text()
```

*The function data.frame() creates data frames, tightly coupled collections of variables which share many of the properties of matrices and of lists, used as the fundamental data structure by most of R's modeling software.*
```
product_table=data.frame(name,price_add,rating_out_of_5,stringsAsFactors = FALSE)
summary(product_table)
view(product_table)
```
*Save summaries of partitioned breeding values to CSV files on disk for further analyses of processing with other software or just for saving (backing up) results.*
```
write.csv(product_table,"product_table.csv")
```
------------------------THE END------------------------------- 


