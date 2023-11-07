# Telecom Provider "churn" dataset

The dataset used to demonstrate the use of Pycaret and CrateDB for training 
machine learning models is a churn dataset of a telecom provider.

It includes various attributes relating to customer demographics, services 
subscribed to, billing information, and churn status.

- `customerID`: A unique identifier for each customer.
- `gender`: The customer's gender (e.g., Male, Female).
- `SeniorCitizen`: Indicates whether the customer is a senior citizen (1) or 
  not (0).
- `Partner`: Indicates whether the customer has a partner (Yes) or not (No).
- `Dependents`: Indicates whether the customer has dependents (Yes) or not 
  (No).
- `tenure`: The total amount of time that the customer has been with the 
  company.
- `PhoneService`: Indicates whether the customer has a phone service (Yes) 
  or not (No).
- `MultipleLines`: Indicates whether the customer has multiple lines (Yes), 
  no multiple lines (No), or no phone service.
- `InternetService`: The type of internet service the customer has (DSL, 
  Fiber optic, or None).
- `OnlineSecurity`: Indicates whether the customer subscribes to an additional
   online security service (Yes, No, or No internet service).
- `DeviceProtection`: Whether the customer has a device protection plan (Yes, 
  No, or No internet service).
- `TechSupport`: Indicates whether the customer has tech support services (Yes, 
  No, or No internet service).
- `StreamingTV`: Indicates if the customer has streaming TV service (Yes, No, 
  or No internet service).
- `StreamingMovies`: Indicates if the customer has streaming movies service 
  (Yes, No, or No internet service).
- `Contract`: The type of contract the customer has (Month-to-month, One year, 
  Two years).
- `PaperlessBilling`: Indicates whether the customer has paperless billing (Yes) 
  or not (No).
- `PaymentMethod`: The customer's payment method (Electronic check, 
  Mailed check, Credit card (automatic), etc.).
- `MonthlyCharges`: The amount charged to the customer each month.
- `TotalCharges`: The total amount charged to the customer over the time they 
  have been with the company.
- `Churn`: Indicates whether the customer has churned (Yes) or not (No).
