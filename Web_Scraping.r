install.packages("robotstxt")
install.packages("rvest")

library(robotstxt)
library(rvest)


#SCRAPPING WEBSITE
link<-'https://www.amazon.in/s?k=apple+smart+watches+for+men&rh=n%3A976419031%2Cp_89%3AApple&dc&crid=3W07DH8Z6ZI1W&qid=1653596996&rnid=3837712031&sprefix=apple+s%2Caps%2C213&ref=sr_nr_p_89_1'
page<-read_html(link)

name<-page%>%html_nodes(".s-line-clamp-4")%>%html_text()


price<-page%>%html_nodes(".a-price-whole")%>%html_text()
price_add<-paste("₹",price)

rating_out_of_5<-page%>%html_nodes(".aok-align-bottom")%>%html_text()

product_table=data.frame(name,price_add,rating_out_of_5,stringsAsFactors = FALSE)
write.csv(product_table,"product_table.csv")




