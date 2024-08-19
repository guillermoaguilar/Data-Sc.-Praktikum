Democracy, Student Protests and State Violence
Autors: Melis Kazan, Zied Marrakchi, Miranda Mehmedali 

Code documentation for course Praktikum Data Science in Python and R  - TU Berlin - SoSe24
This repository documents our data analysis on the relationship between democracy and state violence on student protests.

Motivation:
Freedom of speech and freedom og assembly are the core principles of demoracy. Many western countries (In database: democratic) take pride in letting their citizens speak up about their issues and supporting them and condemn those countries who don't do so (In database: non-democratic). However we were curious about whether or not this is true. To do our experiment, we chose to compare state violence in student protests in (non)democratic countries, as students have historically been critical of states and rooted for social change.

Research Question:
How does democracy influence the use of state violence in response to protests with student participation? 
Here our independent variable is democracy and dependent state violence.

The Dataset: Mass Mobilization Protest Data
Principal investigators : David H.Clark & Patrick M.Regan
Target Group : Protesters in 162 Countries 
Period : between 1990 and 2014 
Goal : Understand citizen movements against governments 
Method of collection : The search is restricted to newspaper sources

Operationalization:
Filtered useful variables
Removed rows where protest == 0
Added clean_identity
Added state_violence
Removed rows where gwf_democracy == NA (years > 2010)

Data Questions:  
How many student-led protests took place in democratic and non-democratic countries between 1990 and 2010?
![alt text](https://github.com/ZiedMarr/Data-Sc.-Praktikum/blob/main/Plots/Number%20of%20students%20protests.png)

What is the percentage of protests with student participation that caused a violent state response in democratic and non-democratic countries between 1990 and 2010? (With farmers as a control group)
![alt text](https://github.com/ZiedMarr/Data-Sc.-Praktikum/blob/main/Plots/Students-Farmers%2Bnumber.png)

What is the percentage of protests with student participation that caused a violent state response in democratic and non-democratic countries between 1990 and 2010? (With medical workers as a control group)
![alt text](https://github.com/ZiedMarr/Data-Sc.-Praktikum/blob/main/Plots/violence-students-meds.png)

What is the percentage of student protests for each protester demand in democratic and non-democratic countries?
![alt text](https://github.com/ZiedMarr/Data-Sc.-Praktikum/blob/main/Plots/demands.png)



Usage:
1/ Import the data ( /data/data.csv ) to the workspace.
2/ Cleaning the data : run the clean_data script 
3/ Plotting the number of students protests in democratic and non-democratic countries : run the n of student protest plot script 
4/ Plotting the percentage of protests that got a violent state response for students and farmers groups for democratic and non-democratic countries : run the Students-Farmers script
5/ Plotting the percentage of students protests by protester demands : run the Percentage for Demands plot script 
