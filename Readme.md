Covid, A catalyst for new job roles ?
========================================================

https://www.kaggle.com/datasets/jackogozaly/data-science-and-stem-salaries

I want to study how the job roles have evolved over the four-year period of the dataset ( 2017-2021).

Over the past couple of years, It has been widely hyped that process automation and machine learning implementation in industrial workflow would cannibalize job roles and bring in demand for new roles while rendering traditional job roles obsolete. User Experience roles in design and research are currently the hyped roles and are considered the next big thing as data science roles were previously held. There are also unforeseen factors like the advent of covid and issues of ethical irresponsibility by corporate giants. It is my opinion that studying this dataset can reveal insights into these topics.

One of the questions I have is how has covid affected the cities people take up jobs in.  How the distribution of job roles and their cities have changed since the advent of covid and the adoption of remote work. I hypothesize that more people have taken up roles in smaller cities owing to the lower living expenses since covid. Do social media trends that advocate this hold any truth? Do people still choose to work at the headquarters?

Are there any new job roles that have been introduced in recent years? Have any of the past roles been rendered obsolete or witnessing a decline in the number of new hires? Any impact of automation on this phenomenon?

What are the new fields that are trending in recent years? Have there been any new fields since the advent of covid? What roles are now witnessing an increasing demand since the advent of covid?

Are there any differences in role hiring patterns and demand before and since the advent of covid? How has the rating of the companies changed since the wider adoption of remote work due to covid?

Has there been any increase in the roles that oversee ethical responsibilities?

How do salaries differ over fields? Has base salary increased over the 4 year period?  What roles now offer lucrative salaries?  Have data science roles reached saturation? How is the demand for UX roles in companies? 

These are some of the questions I hope to get insight into. Answers to these questions will help me and my fellow students to make better-informed decisions in the future.

I hope to use the tools that are thought in Bios 611 course to work on the dataset to generate the needed insights.


=====================================================================================================================


Getting Started
===============

Build the docker image by typing:
```
docker build . -t project611
```

And then start an RStudio by typing:

```
docker run -v $(pwd):/home/rstudio/project -p 8787:8787 -e PASSWORD=<some-password>
```

Once the Rstudio is running connect to it by visiting
https://localhost:8787 in your browser. 

To build the final report, visit the terminal in RStudio and type

```
make report.pdf


Alternatively run 
```
docker run -v $(pwd):/home/rstudio/project\
       --user="rstudio" --workdir="/home/rstudio/project" -t project611\
       make report.pdf
       
```