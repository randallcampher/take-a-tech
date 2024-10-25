<h1 align="center">Product Return Rate at Take-a-Tech</h1




## Executive Summary 

<br>This project investigates the relationship between product quality and product return rates at **Take-a-Tech**, a leading e-commerce retailer in electronics. The analysis explores whether product quality significantly influences return rates, providing actionable insights for reducing returns and improving customer satisfaction.<br>

Key findings include:
- A Chi-square test revealed no statistically significant correlation between reported quality issues and return rates (p-value: 0.4727).
- Factors like mismatched expectations, incorrect items received and delays in delivery emerged as key reasons for returns, suggesting that product quality is not the primary driver.
- Recommendations focus on improving product descriptions, implementing Net Promoter Score (NPS) surveys and tracking customer satisfaction scores.

<p align="center">
  <img src="https://github.com/randallcampher/take-a-tech/blob/main/image%204.png" alt="report" width="100%" height="300">
 </p><br>

## Introduction

**Take-a-Tech** faces challenges with product returns. This analysis aims to assess whether product quality is a significant driver behind these returns, helping to identify potential areas for improvement in product offerings and customer satisfaction.

## Project Objective

The objective of this project is to analyse the relationship between product quality and return rates, determining if quality concerns significantly impact customer return behaviours. The analysis focuses on metrics such as product return rate and sales volume to provide insights.

## Key Insights Summary

No Significant Correlation Between Product Quality and Returns:

- A Chi-square test was conducted to assess whether product quality issues are directly linked to higher return rates.
- The test produced a p-value of 0.4727, indicating no statistically significant correlation between quality complaints and product returns.
- This suggests that while product quality might affect individual cases, it is not the primary factor driving the overall return rates.<br>

Primary Reasons for Returns:

- Analysis of customer feedback highlighted that common reasons for returns included:
  - "Wrong item received"
  - "Changed my mind"
- These reasons suggest a potential gap between customer expectations and product descriptions, as well as logistical issues.<br>

Importance of Customer Experience Factors:

- Further investigation into customer comments revealed that dissatisfaction often stemmed from factors like:
- Incorrect items being delivered.
- Unmet product expectations due to inadequate descriptions.
- Delays in delivery.

These insights indicate that addressing multiple aspects of the customer experience—beyond product quality—could significantly reduce return rates.



## Data and Methodology

### Requirements Gathering
- **Objective**: Determine whether product quality is the main reason for product returns.
- **Key Performance Indicator (KPI)**: Product return rate.
- Data to be analysed includes:
  - **Product Data**: Specifications, categories and quality attributes.
  - **Customer Feedback**: Surveys and comments highlighting reasons for returns.
  - **Sales Data**: Records of sales transactions.

<br>
<p align="center">
  <img src="https://github.com/randallcampher/take-a-tech/blob/main/erd.png" alt="erd" width="100%" height="300">
</p>
<p align="center"><b>Figure 1: Entity Relationship Diagram (ERD)</b></p>
<br>


### Data Cleaning & Preparation
- Addressed missing values, duplicate records and normalised date features.
- Ensured data consistency and accuracy for robust analysis.

##### SQL Queries
```sql
-- a. Checking for Null Values in feedback_data table
SELECT * 
FROM feedback_data
WHERE feedbackid IS NULL
   OR productid IS NULL
   OR returndate IS NULL
   OR returnreason IS NULL
   OR customerfeedback IS NULL;

-- b. Checking for Null Values in product_data table
SELECT * 
FROM product_data
WHERE productid IS NULL
   OR productcategory IS NULL
   OR productattributes IS NULL;

-- c. Checking for Null Values in sales_data table
SELECT * 
FROM sales_data
WHERE saleid IS NULL
   OR productid IS NULL
   OR salesdate IS NULL
   OR salesvolume IS NULL
   OR revenuegenerated IS NULL;
   
-- d. Changing the data type of returndate column to DATE
ALTER TABLE feedback_data
MODIFY COLUMN returndate DATE;

-- e. Changing the data type of salesdate column to DATE
ALTER TABLE sales_data
MODIFY COLUMN salesdate DATE;

-- f. Checking for duplicate feedbackid in feedback_data table
SELECT feedbackid,
       COUNT(*) AS duplicate_count
FROM feedback_data
GROUP BY feedbackid
HAVING COUNT(*) > 1;

-- g. Checking for duplicate productid in product_data table
SELECT productid,
       COUNT(*) AS duplicate_count
FROM product_data
GROUP BY productid
HAVING COUNT(*) > 1;

-- h. Checking for duplicate productid in sales_data table
SELECT saleid,
       COUNT(*) AS duplicate_count
FROM sales_data
GROUP BY saleid
HAVING COUNT(*) > 1;
```

### Data Analysis
- Descriptive analysis was conducted to summarise key statistics (mean, max, min).
- **Chi-square Test**:
  - Used to examine the relationship between quality issues and return rates.
  - Resulted in a p-value of 0.4727, indicating no significant correlation between product quality issues and return rates.

### Customer Feedback Analysis
```python
# Extracting insights from 'Customer Feedback' related to product quality
# Assume feedback mentioning terms like 'defective', 'poor quality', 'not as described' etc. indicate quality issues
quality_related_terms = ['defective',
                        'poor quality',
                        'disappointing',
                        'poor',
                        'malfunctioning',
                        'faulty',
                        'subpar',
                        'unsatisfactory',
                        'unreliable',
                        'underwhelming',
                        'limited functionality',
                        'performance issues',
                        'software bugs',
                        'hardware failure',
                        'glitchy',
                        'inconsistent',
                        'slow',
                        'overheating',
                        'not worth the price',
                        'broke after a few uses',
                        'short lifespan',
                        'low battery life',
                        'not responsive',
                        'poor sound quality',
                        'screen issues',
                        'connectivity problems'
]


# Adding a new column 'Quality Issue' to indicate if the feedback suggests a quality issue
all_data['qualityissue'] = all_data['customerfeedback'].apply(
    lambda x: any(term in x.lower() for term in quality_related_terms)
)
# Analyzing the frequency of returns due to quality issues
quality_issue_returns = all_data['qualityissue'].value_counts()

# Visualizing the relationship between product category and quality issues
plt.figure(figsize=(15, 10))
custom_colors = ['#009E73', '#CC79A7']
sns.countplot(x='productcategory', hue='qualityissue', data=all_data, width=0.7, palette=custom_colors)

# Adjust layout
plt.title('Quality Issues by Product Category', fontsize=16)
plt.ylabel('Count of Quality Issues', fontsize=14)
plt.xlabel('Product Category', fontsize=14)
plt.legend(title='Quality Issues', bbox_to_anchor=(1.05, 1), loc='upper left')

plt.show()
```

### Sqi-Squared Test
```python
# To statistically ascertain the relationship between quality issues and return rates,
from scipy.stats import chi2_contingency
import matplotlib.colors as mcolors

# Preparing a contingency table for the chi-square test
contingency_table = pd.crosstab(all_data['productcategory'], all_data['qualityissue'])

# Performing the chi-square test
chi2, p, dof, expected = chi2_contingency(contingency_table)

# Results of the chi-square test
chi2_test_result = {
    "Chi-Square Statistic": chi2,
    "p-value": p,
    "Degrees of Freedom": dof,
    "Expected Frequencies": expected
}
```
### Data Visualization
- Various data visualisations were created to highlight trends and patterns.
- The analysis revealed that reasons like "wrong item received" and "changed my mind" were prevalent among return cases.

<br>
<p align="center">
  <img src="https://github.com/randallcampher/take-a-tech/blob/main/image%201.png" alt="Chart 1" width="100%" height="300">
</p>
<p align="center"><b>Chart 1: Return Reason by Product Category</b></p>
<br>
<br>
<p align="center">
  <img src="https://github.com/randallcampher/take-a-tech/blob/main/image%202.png" alt="Chart 2" width="100%" height="300">
</p>
<p align="center"><b>Chart 2: Quality Issues by Product Category</b></p>
<br>

<br>
<p align="center">
  <img src="https://github.com/randallcampher/take-a-tech/blob/main/image%203.png" alt="Chart 3" width="100%" height="300">
</p>
<p align="center"><b>Chart 3: Return Reasons</b></p>
<br>

## Recommendations

Based on the findings, the following recommendations are proposed to reduce the product return rate:

1. **Enhance Product Descriptions**:
   - Improving transparency and accuracy in product descriptions can help align customer expectations, reducing returns due to dissatisfaction.
2. **Implement NPS Surveys**:
   - Introduce regular Net Promoter Score (NPS) surveys to monitor customer loyalty and satisfaction.
   - Aim for an NPS score above 50 to boost retention and word-of-mouth recommendations.
3. **Track Customer Satisfaction Scores**:
   - Conduct post-purchase satisfaction surveys focusing on packaging, delivery speed, and customer support.
   - Aim for a satisfaction rate above 80% to improve the overall customer experience.

## Tech Stack

The following tools and technologies were utilised for this analysis:

- **SQL**: Data collection, storage and manipulation.
- **Python**: Data analysis and visualisation using libraries like `pandas`, `seaborn` , `matplotlib` and `scipy`.
- **Excel**: For reporting.
- **GitHub**: For documentation.
- **PowerPoint**: For presenting the analysis findings.

## Conclusion

The analysis concluded that product quality is not the primary factor influencing product returns at Take-a-Tech. The lack of a significant statistical relationship between quality issues and returns suggests that other factors, like mismatched customer expectations, play a larger role. The recommendations focus on enhancing product descriptions and gathering customer feedback to address these issues.


