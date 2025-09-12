# Hospital Data Analytics Dashboard

##  Executive Summary

This Power BI dashboard provides a comprehensive analysis of hospital operations, covering **55,495 admissions** with **$1.42 billion** in total billing. The report reveals key insights into patient demographics, admission trends, financial performance, and operational efficiency.


##  Key Performance Indicators

| Metric | Value |
| :--- | :--- |
| **Total Admissions** | 55,495 |
| **Total Billing Amount** | $1.42bn |
| **Average Billing Amount** | $25,540 |
| **Average Length of Stay** | 15.51 days |

##  Admissions Analysis

### Monthly Admission Trends (2020-2024)
<img width="985" height="435" alt="image" src="https://github.com/user-attachments/assets/b1e8a0a8-13fc-413d-b73f-0ec10f957ad2" />

### Admission Type Distribution

| Admission Type | Count | Percentage |
| :--- | :--- | :--- |
| Elective | 18,650 | 33.61% |
| Urgent | 18,580 | 33.47% |
| Emergency | 18,270 | 32.92% |

<img width="830" height="511" alt="image" src="https://github.com/user-attachments/assets/f88fbcf1-e212-495a-acda-830c22826709" />

##  Medical Condition Analysis

### Average Length of Stay by Condition

| Medical Condition | Avg. Stay (Days) |
| :--- | :--- |
| Asthma | 12.5 |
| Arthritis | 14.5 |
| Cancer | 21.5 |
| Obesity | 16.0 |
| Hypertension | 20.0 |
| Diabetes | 15.0 |

### Average Billing by Condition and Admission Type

| Medical Condition | Elective | Emergency | Urgent |
| :--- | :--- | :--- | :--- |
| Cancer | $42,000 | $38,000 | $40,000 |
| Hypertension | $28,000 | $25,000 | $26,500 |
| Diabetes | $24,000 | $22,000 | $23,000 |
| Obesity | $23,500 | $21,500 | $22,500 |
| Arthritis | $19,000 | $18,000 | $18,500 |
| Asthma | $16,000 | $15,500 | $15,800 |

##  Financial Analysis

### Total Billing Amount by Year

| Year | Total Billing Amount |
| :--- | :--- |
| 2019 | $0.1bn |
| 2020 | $0.1bn |
| 2021 | $0.2bn |
| 2022 | $0.2bn |
| 2023 | $0.3bn |
| 2024 | $0.3bn |

### Insurance Provider Breakdown

| Insurance Provider | Market Share | Total Billing |
| :--- | :--- | :--- |
| Cigna | 30% | $426M |
| Blue Cross | 28% | $397.6M |
| United Health | 22% | $312.4M |
| Medicare | 13% | $184.6M |
| Astha | 7% | $99.4M |

##  Test Results Analysis

### Overall Test Results Distribution

| Result | Count | Percentage |
| :--- | :--- | :--- |
| Normal | 18,516 | 33.37% |
| Abnormal | 18,624 | 33.56% |
| Inconclusive | 18,355 | 33.08% |

### Detailed Test Results by Medical Condition

| Condition | Normal | Abnormal | Inconclusive | Total |
| :--- | :--- | :--- | :--- | :--- |
| Arthritis | 3,032 | 3,106 | 3,086 | 9,306 |
| Asthma | 3,146 | 3,009 | 3,028 | 9,183 |
| Cancer | 3,049 | 3,118 | 3,060 | 9,227 |
| Diabetes | 3,094 | 3,168 | 3,046 | 9,304 |
| Hypertension | 3,142 | 3,011 | 3,091 | 9,244 |
| Obesity | 3,057 | 3,132 | 3,042 | 9,231 |

##  Medication Analysis

### Top Medications Prescribed

| Medication | Prescription Count |
| :--- | :--- |
| Lipitor | 28,000 |
| Ibuprofen | 26,500 |
| Aspirin | 24,500 |
| Paracetamol | 23,000 |
| Penicillin | 19,500 |

##  Demographic Analysis

### Age Group Distribution

| Age Group | Percentage | Count |
| :--- | :--- | :--- |
| 55 and above | 35% | 19,423 |
| 45-54 | 25% | 13,874 |
| 35-44 | 20% | 11,099 |
| 25-34 | 12% | 6,659 |
| 18-24 | 5% | 2,775 |
| Under 18 | 3% | 1,665 |

##  Operational Metrics

### Room Utilization Analysis

| Room Range | Utilization Level | Notes |
| :--- | :--- | :--- |
| 100-199 | High | Peak utilization |
| 200-299 | Medium | Moderate usage |
| 300-399 | Low | Underutilized |
| 400-500 | Very Low | Minimal usage |

##  Key Insights & Recommendations

### Strategic Insights
1. **Revenue Growth**: Steady 200% increase in billing from 2019-2024
2. **Operational Efficiency**: Average stay of 15.51 days across all conditions
3. **Patient Mix**: Balanced distribution across admission types
4. **Clinical Focus**: Cancer and hypertension require longest stays

### Recommendations

**Resource Allocation**
- Focus on high-utilization rooms (100-200)
- Optimize staffing for peak admission months
- Enhance capacity for cancer and hypertension care

**Financial Strategy**
- Strengthen partnerships with Cigna and Blue Cross
- Develop specialized programs for high-billing conditions
- Implement cost optimization in medium-utilization areas

**Clinical Improvement**
- Reduce length of stay for cancer patients
- Improve diagnostic clarity (33% inconclusive results)
- Standardize medication protocols

##Data Sources & Methodology

**Data Period**: 2019-2024  
**Total Records**: 55,495 admissions  
**Data Points Collected**:
- Patient demographics
- Admission details
- Billing information
- Medical conditions
- Test results
- Medication records

**Tools Used**: Power BI, SQL, Data Visualization Techniques

