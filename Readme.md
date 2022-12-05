Data sci job analysis in 2017-2021 ?
========================================================================================        
(dataset in source_data folder.)

I want to study how the job roles have evolved over the four-year period of the dataset ( 2017-2021).

Over the past couple of years, It has been widely hyped that process automation and machine learning implementation in industrial workflow would cannibalize job roles and bring in demand for new roles while rendering traditional job roles obsolete.  There are also unforeseen factors like the advent of covid and economic shifts in corporate giants. It is my opinion that studying this dataset can reveal insights into these topics.

One of the questions I have is how Compensation varies with the Years of Experience.  How the distribution of job roles and their companies have changed over the years and study Most Common Job Titles. what are the Top Companies For Data Scientists? study the Racial Makeup For Data Scientist Roles and their Compensation breakup By Years of Experience and in general. what is the Education Makeup For Data Scientist Roles and how does Compensation For Data Scientists vary with Education?

Best Companies For Data Scientists? Best Companies For Software Engineers?


These are some of the questions I hope to get insight into. Answers to these questions will help me and my fellow students to make better-informed decisions in the future.

I hope to use the tools thought in Bios 611 course to work on the dataset to generate the needed insights.


=====================================================================================================================


Getting Started
===============

Build the docker image by typing:
```
docker build . -t 611project
```
Create a .password file containing the password.
default is pwd

And then start an RStudio by typing:

```
docker run -v $(pwd):/home/rstudio/work -p 8787:8787 -e PASSWORD="$(cat .password)" -it 611project

```

Once the Rstudio is running connect to it by visiting
https://localhost:8787 in your browser. 

change to directory work and run the below commands in the terminal in RStudio to build the report:

```
cd work
make clean

make report.pdf



```
