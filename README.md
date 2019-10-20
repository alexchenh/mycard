# mycard
Using TensorFlow to train a Keras model to suggest the best credit card based on customer information and transaction history.

## Inspiration
When we look at our student mailboxes, we find ourselves getting spammed by banks like American Express, encouraging us to sign up for their credit cards. When looking online to see which credit card we should select, we are bombarded with lots of percent-values and not much understanding of which card would benefit us the best. 

It seems like our confusion surrounding credit card benefits was not unique. According to the recent J.D. Power 2019 Credit Card Satisfaction Survey, only 36% of consumers fully understand the benefits their cards offer outside of the basic rewards. Competition among card issuers led to a benefits arms race that allowed for the plethora of benefits associated with cards. However, consumers don't know exactly how much they could potentially save with each card and the additional perks beyond the basic cash backs. 

This confusion does not only affect consumers. Card issuers also lose out when consumers don't understand the benefits of their cards. According to the same J.D. Power survey, consumers who fully understand the rewards program spend an average of $307 more per month with their card than those who don't understand. 

People want information about what card would serve their interests the best and what benefits they reap with their card, but a comprehensive system to deliver this information does not exist. 

## What it does
Fundamentally, MyCard is supposed to use a ML model that predicts which credit card (and its rewards program) would be best for the user's future spending patterns. The model is trained using transaction data as well as other variables like location, student status, account balance and more. In doing so, MyCard is able to make the leap from statistical probability to accurate prediction.

Compared to existing tools and banking sites, our tool represents a major step forwards. Many current qualitative tools use only basic calculations to inform the user how much they could be saving. For example, CapitalOne currently has a [slider](https://www.capitalone.com/credit-cards/quicksilverone/) to determine how much the user could save, requiring the user to input their own monthly expenditure amount. Other tools guide users through a series of questions, asking what users would prefer (flights, or cash back, or a low interest rate, etc.), but when users answer these subjective questions it can point them towards a card that might be personally appealing, but financially not the optimal choice.

## Considerations
If a bank's customers were happy to receive no benefits with their credit cards, the bank would be happy to lose less money paying out these rewards. But because of competition with other credit cards, a bank must balance attracting users with competitive rewards programs with the amount earned through the interest on payments. We noticed this means a tool offered by banks that helps the customer maximize their rewards runs counter to the interests of the bank, however, we believe that 1) this is the right thing to do, and 2) the banking industry will need to evolve with consumers who are fed up the shortcomings of current banks and are looking for more user-focused alternatives (see [envel](https://www.envel.ai/)). 

## How we built it
TensorFlow, R, Python, Figma, Jupyter Notebook

## Challenges we ran into
We had to generate our own dataset because public datasets of individuals' banking transactions are unavailable. As a result, we used R to generate a dataset that normally distributed the average expenditure in various merchant categories. Because of the inaccuracy of our dataset, we had to feed in more a dataset with more individuals to train our model. Moreover, it was our first time working with TensorFlow, so we had to overcome the learning curve in a period of 36 hours. 

## Accomplishments that we're proud of
* Learning to use TensorFlow in a short period of time
* Scripting a dataset generator to emulate the expenditure breakdowns of many customers
* Using the dataset to train a proof-of-concept ML model
* Demystifying the credit card benefit comparison process to help people take control of their finances and their banking

## What we learned
* ML
* TensorFlow
* Financial Technology Regulations

## What's next for MyCard
We have many ideas on where to take this next!

First, closer integration with banks would allow the model to be trained using significantly larger (and real) datasets, and would allow us to build a model that could much more accurately suggest the right credit card for everyone.

However, the underlying idea of using past transactions to predict future transactions has far-reaching implications. One implementation we imagined was having custom credit card, where our model predicts the best combination of benefits possible while providing an interest rate that reduces the risk of defaulting and allows the bank to remain profitable. 
