Create Database DWLoanApplication_Test
Go
Use DWLoanApplication_Test 
Go
Create Schema Dim
Go
Create Schema Fact


Create Table Dim.Borrower
(	
DimBorrowerKey int Primary key identity,
BorrowerID int Not Null,
SSN varchar(9) NOT NULL,
FirstName varchar(75) NOT NULL,
LastName varchar(75) NOT NULL,
DateOfBirth date NOT NULL,
MaritalStatus Varchar(15) NOT NULL,
Gender Varchar(15) NOT NULL,
NumberOfDependent tinyint NULL,
Email Varchar(75) Null,
Phone varchar(12) NOT NULL, 
CurrentStreetAddress varchar(50) NOT NULL,
City varchar(50) NOT NULL,
State Varchar(15) NOT NULL,
Zip varchar(10) NOT NULL,
YearsAtThisAddress tinyint NOT NULL, 
IsCosinger Varchar(5) NOT NULL,
PrimaryBorrowerSSN varchar(9)  NULL,
CreditScore smallint NOT NULL, 
EmployementStatus varchar(15) NOT NULL

	)





Create table Dim.Employment_Business		
(
DimEmployment_BusinessKey Int identity primary key, 
EPID int Not Null,
CompanyName Varchar(75) Not Null,
CurrentAddress varchar(100) Not Null,
City varchar(50) Not Null,
[State] Varchar(50) Not Null,
Zip varchar(10) ,
PositionTitle varchar(50) Not Null,
CompanyPhone varchar(12) NOT NULL ,
YrsonJob tinyint,
BorrowerID int
--BorrowerID int
)



Create Table Dim.Bank 
(
DimBankKey Int primary key Identity,
BankID 	smallint Not Null,
[Name]	varchar(50) Not null,
Discription	varchar(250) Not Null,
Address	varchar(75)Not Null,
Zip	Varchar(10) Not Null,
City	varchar(50) Not Null,
State Varchar(15) Not Null

)	


Create Table Dim.Branch
(
DimBranchKey Int  Primary key identity,
BranchID smallint Not Null,
BranchName	Varchar(75) Not Null,
Phone	Varchar(12) Not Null, 
Street_Address	Varchar(75) Not Null,
City	Varchar(50) Not Null,
Zip	Varchar(10) Not Null,
State Varchar(15) Not Null,
BankID	smallint Not Null,

)


Create table Dim.LoanOfficer
(
DimLoanOfficerKey Int primary key,
LoanOfficerID smallint Not Null,
FirstName	Varchar(75) Not Null,
LastName	Varchar(75) Not Null,
EMAIL	Varchar(75) Not Null,
PHONENUMBER	Varchar(12) Not Null, 
HIREDATE	date Not Null, 
Position	Varchar(75) Not Null,
SALARY	Money Not Null,
BranchID	smallint Not Null
)



Create table Dim.MortgageLoanApplication
(
DimMortgageLoanApplicationKey Int primary key identity,
MortgageapplicationID int Not Null,
Loan_Type	Varchar(25) Not Null,
PropertyType varchar(50) Not Null,
PropertyStreeAddress varchar(75) Not Null,
PropertyCity	varchar(50) Not Null,
Propertyzip	varchar(10) Not Null,
PropertyState Varchar(25) Not Null,
ApplicationID	int Not Null,
 
)

Create table Dim.AutoLoanApplication
(
DimAutoLoanApplicationKey Int Primary Key identity,
AutoApplicationID int Not Null,
LoanType Varchar(25) Not Null ,
vehicle_type char(5) Not Null,-- It can be Used or New
Maker	varchar(50)Not Null,
Model	varchar(50)Not Null,
[Year]	char(4) Not Null,-- it can be 1981,2020,2125
Mileage	int Not Null,
ApplicationID	int Not Null,

)

Create table Dim.PersonalLoanApplication
(
DimPersonalLoanApplicationKey Int Primary Key Identity,
PersonalApplicationID int Not Null,
loantype Varchar(25) Not Null,
Reason_For_loan	varchar(250) Not Null,
ApplicationID int Not Null,

)





Create table Dim.IncomeExpenseinfo
(
DimIncomeExpenseKey Int Primary Key Identity,
IncomeExpensId Int Not Null,
MonthlyGrossIncome money Not Null ,
MonthlyMortgageRent Money Not Null ,
MonthlyOther_Loan_Expense Money Not Null ,
BorrowerID Int Not Null,

)	



Create table Fact.LoanApplicationDetail_Fact
(
ApplicationId Int Not Null,
LoanType Varchar(25) Not Null,
PurchasePrice Money Not Null, 
DownPaymentAmount Money Not Null,
LoanAmount	Money Not Null,
ApplicationDate date Not Null,
ApplicationStatus Varchar(25) Not Null,
[DimLoanOfficerKey] Int Not Null Constraint FK_DimLoanOfficer_LoanFact Foreign key References Dim.LoanOfficer(DimLoanOfficerKey),
DimBorrowerKey Int Not Null Constraint FK_DimBorrower_LoanDetailFact Foreign key References Dim.Borrower(DimBorrowerKey),
)	


Create Table Fact.LoanContract_Payment_Fact
(
LoanID	int Not Null,
ApplicationID Int Not Null,
LoanStatus Varchar(25) NOT NULL,
DateContractStarts DATE NOT NULL,
DateContractEnd	DATE NOT NULL,
InterstRate DECIMAL(5,2) NOT NULL, 
ScheduledPaytAmount MONEY NOT NULL,
SchechuledNumOfPayt SMALLINT NOT NULL,
ActualNumOfPayment INT NOT NULL,
LoanAmountLeft MONEY NOT NULL,
PaymentID	Int NOT Null,
LoanPaymentAmount MONEY NOT NULL,
LoanPaymentDueDate DATE NOT NULL,
[DimBranchKey] Int Not Null Constraint FK_DimBranch_LoanPmtFact Foreign key References Dim.Branch(DimBranchKey),

)


