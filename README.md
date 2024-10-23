<h1 align="center">Product Return Rate at Take-a-Tech</h1
![logo](https://github.com/user-attachments/assets/8afa1d57-4803-4042-a979-0d52cb893bbc)

## Executive Summary 

<br>This project investigates the relationship between product quality and product return rates at **Take-a-Tech**, a leading e-commerce retailer in electronics. The analysis explores whether product quality significantly influences return rates, providing actionable insights for reducing returns and improving customer satisfaction.<br>

Key findings include:
- A Chi-square test revealed no statistically significant correlation between reported quality issues and return rates (p-value: 0.4727).
- Factors like mismatched expectations, incorrect items received, and delays in delivery emerged as key reasons for returns, suggesting that product quality is not the primary driver.
- Recommendations focus on improving product descriptions, implementing Net Promoter Score (NPS) surveys and tracking customer satisfaction scores.

## Introduction

**Take-a-Tech** faces challenges with product returns. This analysis aims to assess whether product quality is a significant driver behind these returns, helping to identify potential areas for improvement in product offerings and customer satisfaction.

## Project Objective

The objective of this project is to analyse the relationship between product quality and return rates, determining if quality concerns significantly impact customer return behaviours. The analysis focuses on metrics such as product return rate and sales volume to provide insights.

## Data and Methodology

### Requirements Gathering
- **Objective**: Determine whether product quality is the main reason for product returns.
- **Key Performance Indicator (KPI)**: Product return rate.
- Data to be analyzed includes:
  - **Product Data**: Specifications, categories, and quality attributes.
  - **Customer Feedback**: Surveys and comments highlighting reasons for returns.
  - **Sales Data**: Records of sales transactions.

### Data Cleaning & Preparation
- Addressed missing values, duplicate records, and normalized date features.
- Ensured data consistency and accuracy for robust analysis.

### Data Analysis
- Descriptive analysis was conducted to summarize key statistics (mean, max, min).
- **Chi-square Test**:
  - Used to examine the relationship between quality issues and return rates.
  - Resulted in a p-value of 0.4727, indicating no significant correlation between product quality issues and return rates.

### Data Visualization
- Various data visualizations (e.g., bar charts, pie charts) were created to highlight trends.
- The analysis revealed that reasons like "wrong item received" and "changed my mind" were prevalent among return cases.

![Placeholder for Data Visualization 1](images/data-visualization-1.png)
![Placeholder for Data Visualization 2](images/data-visualization-2.png)

## Tech Stack

The following tools and technologies were utilized for this analysis:

- **SQL**: Data collection, storage, and manipulation.
- **Python**: Data analysis and visualization using libraries like `pandas`, `seaborn`, and `matplotlib`.
- **GitHub**: For version control and documentation.
- **PowerPoint**: For presenting the analysis findings.

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

## Conclusion

The analysis concluded that product quality is not the primary factor influencing product returns at Take-a-Tech. The lack of a significant statistical relationship between quality issues and returns suggests that other factors, like mismatched customer expectations, play a larger role. The recommendations focus on enhancing product descriptions and gathering customer feedback to address these issues.

## Sample Code

### SQL Code: Retrieving Product Return Data
```sql
SELECT product_id, COUNT(return_id) AS return_count, quality_issues
FROM returns
JOIN products ON returns.product_id = products.id
GROUP BY product_id, quality_issues;

