# Product Return Rate Analysis  
**Compiled by:** Randall Campher  

---

## Project Background and Overview  
This project investigates the relationship between product quality and product return rates at Take-a-Tech, a leading e-commerce retailer specialising in electronics. The  return rates were identified as a significant concern, prompting this analysis to explore whether product quality is a primary factor driving product returns.

---

## Project Goal  
The primary goal of this project is to determine if product quality significantly influences return rates. By doing so, Take-a-Tech can address the underlying causes of returns, which would, in turn, improve sales volume and customer satisfaction.

---

## Data Structure Overview  
The data used in this project comprises:

- **Product Data**: Specifications, categories and quality attributes.
- **Customer Feedback**: Comments and surveys detailing reasons for product returns.
- **Sales Data**: Historical transaction records including return events.

The data was cleaned to address missing values and normalised for time-related features to ensure accuracy. 

<p align="center">
  <img src="https://github.com/user-attachments/assets/39371f7d-abf6-4673-84e2-10ab422004d5 " alt="report" width="100%" height="300">
 </p>

---

## Executive Summary  
The analysis aimed to identify whether product quality was a significant driver of product return rates. However, statistical tests revealed no strong correlation between quality concerns and return rates. Instead, factors such as wrong items received, unmet expectations and mismatches between product descriptions and customer expectations were identified as the leading reasons for returns. Therefore, while product quality may affect individual cases, other factors are more prominent in driving the return rate.

![image](https://github.com/user-attachments/assets/e53f3e64-7000-43ce-b7c0-585fbea3148b)

---

## Insights Deep Dive  

### Statistical Testing  
A Chi-square test was used to evaluate whether there was a significant relationship between product quality issues and return rates. The p-value of 0.4727 indicated that there was no statistically significant correlation. Thus, the hypothesis that product quality alone drives return rates could not be supported.

<p align="center">
  <img src="https://github.com/user-attachments/assets/2271a4df-8b20-4592-b70d-09f559202656" alt="report" width="100%" height="300">
 </p>

### Key Insights  
- **Common Return Reasons**: “Wrong item received” and “Changed my mind” were the most frequent reasons for returns, highlighting potential gaps between product listings and customer expectations.

<p align="center">
  <img src="https://github.com/user-attachments/assets/45a968e0-4065-41bb-bd33-acdb4b575d68" alt="report" width="100%" height="300">
 </p>
 
- **No Clear Quality-Return Link**: Even product categories with lower quality complaints experienced returns, implying that quality concerns were not the primary driver behind returns.
- **Customer Feedback Analysis**: Customer comments revealed that expectations mismatches, inadequate descriptions and delivery delays were critical areas contributing to return behavior.

<p align="center">
  <img src="https://github.com/user-attachments/assets/bdbf52e8-fc5d-4842-af85-684465f15f95" alt="report" width="100%" height="300">
 </p>

---

## Recommendations  

### Improve Product Descriptions  
One key recommendation is to enhance the clarity and accuracy of product descriptions. Doing so will better align customer expectations with the products they receive, thereby reducing returns due to dissatisfaction.

### Implement NPS Surveys  
Introduce regular Net Promoter Score (NPS) surveys to track customer satisfaction and loyalty. Achieving an NPS score above 50 can indicate strong retention and positive customer sentiment, providing valuable feedback for continuous improvement.

### Monitor Customer Satisfaction Beyond Quality  
Conduct post-purchase surveys focusing on aspects beyond product quality, such as packaging and delivery speed. Maintaining a customer satisfaction score above 80% can serve as a KPI for improving the overall customer experience and reducing returns.

---

## Technical Details  
The technical aspects of this analysis involved the use of:

- **SQL**: For data collection and storage.
- **Python**: Leveraging libraries like NumPy, Pandas, Seaborn, and SciPy for data manipulation, statistical evaluation and visualisation.
- **GitHub**: To document the analysis.
- **Excel**: The results were compiled into an Excel workbook as per the initial project requirements.

---

## Caveats and Assumptions  
The analysis did not explore all potential factors influencing return rates, such as customer demographics or marketing impacts. Additionally, the data used had limitations, including incomplete customer feedback in some cases. Future analyses should aim to incorporate more comprehensive datasets and explore alternative hypotheses beyond product quality.

---

## Conclusion  
This project has shown that product quality is not the primary driver of return rates for Take-a-Tech. By addressing broader customer experience issues like mismatched expectations and inadequate descriptions, Take-a-Tech can work towards reducing return rates and improving customer satisfaction.

