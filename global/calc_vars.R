



#Libraries

library(data.table)
library(dplyr)


#
property_value <- 800000
savings_available <- 200000
deposit_amount <- 180000
loan_fees <- 2000

first_home_buyer <- T
stamp_duty_nsw_table <- data.table(
  cutoff = c(0, 15000, 32000, 87000, 327000, 1089000, 3268000),
  base = c(0, 187, 442, 1405, 9805, 44095, 163940),
  variable = c(1.25, 1.5, 1.75, 3.5, 4.5, 5.5, 7)
)

#implement other states + cutoff for min stamp duty + option to pay land tax
stamp_duty <- stamp_duty_nsw_table[cutoff <= property_value] %>% 
  tail(1) %>% 
  mutate(stamp_duty = base + ((property_value - cutoff)/100)*variable) %>% 
  select(stamp_duty) %>% 
  as.numeric()

final_deposit <- deposit_amount - stamp_duty - loan_fees
deposit_percentage <- final_deposit/property_value

loan_amount <- property_value - final_deposit

if(deposit_percentage >= 0.2) {
  lmi <- 0
} else {
  lmi <- ((1 - deposit_percentage)*loan_amount)/100
}

savings_remaining <- savings_available - deposit_amount - lmi

loan_term <- 30
num_payments <- 12*30

annual_interest_rate <- 0.04
monthly_interest_rate <- annual_interest_rate/12
start_date <- as.Date("2023-01-01")

monthly_payment_num <- (monthly_interest_rate * ((1 + monthly_interest_rate)^num_payments))
monthly_payment_den <- ((1 + monthly_interest_rate)^num_payments) - 1
monthly_payment <- loan_amount * (monthly_payment_num / monthly_payment_den)
yearly_payment <- monthly_payment * 12

monthly_cash_injection <- 0

# payment_period_complete 
# date_loan_complete <- 
# person_age_loan_end <- 


# Income/Salary -----------------------------------------------------------

yearly_salary <- 153000
salary_includes_super <- T
super_rate <- 0.095

hecs_loan <- T

#build dynamic hecs table, use 10% for now 
hecs_rate <- 0.1
hecs_remaining <- 31000
hecs_base_inflation <- 0.02
hecs_start_date <- as.Date("2022-09-01")
# hecs_paid_off <- 
# person_age_hecs_end <- 

yearly_super <- yearly_salary * super_rate
monthly_super_rate <- yearly_super / 12

# super_balance at loan_start <- 
# super_yearly_growth_rate <- 0.08
# super_balance_at_loan_end 


#need to calc for when salary not including super
gross_yearly_income <- yearly_salary - yearly_super
gross_monthly_income <- gross_yearly_income / 12


#tax table FY 22/23

tax_table <- data.table(
  cutoff = c(0, 18200, 45000, 120000, 180000),
  base = c(0, 0, 5092, 29467, 51667),
  variable = c(0, 0.19, 0.325, 0.37, 0.45)
)

yearly_tax <- tax_table[cutoff <= yearly_salary][.N] %>% 
  mutate(tax = base + (variable * (gross_yearly_income - cutoff))) %>% 
  select(tax) %>% 
  as.numeric()

monthly_tax <- yearly_tax / 12

yearly_hecs <- gross_yearly_income * hecs_rate
monthly_hecs <- yearly_hecs / 12

medicare_levy <- 0.02 * gross_yearly_income

net_yearly_income <- gross_yearly_income - yearly_tax - yearly_hecs - medicare_levy
net_monthly_income <- net_yearly_income / 12

#separate this out into categories for app
monthly_expenses <- 1500

net_income_minus_expenses_loan <- net_monthly_income - monthly_payment - monthly_expenses


#amortisation schedule 
loan_start_date <- as.Date("2023-01-01")
library(lubridate)
d <- ymd(as.Date('2004-01-01')) %m+% months(1)

amortisation_table <- data.table()
remaining_loan_amount <- loan_amount

for(i in 1:num_payments) {
  
  payment_period <- i
  payment_date <- ymd(loan_start_date) %m+% months(i-1)
  loan_amount_schedule <- remaining_loan_amount
  monthly_payment_schedule <- monthly_payment
  interest_component_schedule <- remaining_loan_amount * monthly_interest_rate
  principal_component_schedule <- monthly_payment_schedule - interest_component_schedule
  remaining_loan_amount <- remaining_loan_amount - principal_component_schedule
  
  amortisation_table <- rbind(
    amortisation_table,
    data.table(
      payment_period = payment_period,
      payment_date = payment_date, 
      loan_amount_schedule = loan_amount_schedule,
      monthly_payment_schedule = monthly_payment_schedule,
      interest_component_schedule = interest_component_schedule,
      principal_component_schedule = principal_component_schedule,
      remaining_loan_amount = remaining_loan_amount,
      period_count = i %% 12
      
    )
  )
  
}























