# Customer-Behaviour-Analysis-MySQL

This project, along with the associated dataset, constitutes a case study available [here](https://8weeksqlchallenge.com/case-study-1/). The primary objective is to delve into customer spending patterns, trends, and the factors that impact them. The study aims to uncover valuable insights into customer preferences, purchasing behavior, and opportunities for enhancing menu offerings and optimizing marketing strategies within a dining establishment.

<br>**BACKGROUND**

Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen. Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.

<br>**PROBLEM STATEMENT**

Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favorite. Having this deeper connection with his customers will help him deliver a better and more personalized experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

<br>**ER DIAGRAM OF SCHEMA**

![1_ER Diagram](https://github.com/md-asif-ar89/Customer-Behaviour-Analysis/assets/145151334/2d152172-aafa-4e13-b790-7cc6d3a38eff)


<br>**QUESTIONS EXPLORED**

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, but sushi always get 2x points and not just in first_week - how many points do customer A and B have at the end of January?

<br>**SUMMARY OF FINDINGS**

1. Customer A holds the distinction of being the highest spender, contributing a total of $76 across all orders, followed closely by Customer B at $74. In contrast, Customer C recorded the lowest expenditure at $36.
2. Customer B boasts the highest frequency of visits to the restaurant, with a tally of 6 visits. Customer A trails with 4 visits, while Customer C has the least number of visits, amounting to 2.
3. The dish "Ramen" emerges as the most frequently ordered item, with a total of 8 instances.
4. Notably, both Customer A and Customer C share a preference for "Ramen," each ordering it a total of 3 times. Conversely, Customer B exhibited a more balanced approach by trying all available menu items, with each item being ordered twice.
5. Interestingly, the last item ordered by both Customer A and Customer B before becoming members was "Sushi."
6. On average, customers spent $32.5 and placed orders for 2.5 items before opting to join the membership program.


