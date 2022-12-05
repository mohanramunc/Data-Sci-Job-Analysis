.PHONY: clean


clean:

	rm -rf figures
	rm -rf .created-dirs
	rm -f report.pdf
	rm -f report.html
	rm -f report.log
	

.created-dirs:

	mkdir -p figures
	touch .created-dirs

# check out the dataset and perform visualization
 .created-dirs ~/work/source_data/data.csv:
	Rscript datajob.R

# Build the final report for the project.
report.html: .created-dirs ~/work/figures/avg_Data_Scientist_Total_Compensation.png           ~/work/figures/Education_Makeup_For_Data_Scientist_Roles.png ~/work/figures/Avg_Software_Engineer_Total_Compensation.png        ~/work/figures/Most_Common_Job_Titles.png ~/work/figures/Compensation_By_Years_of_Experience.png             ~/work/figures/Number_of_Salaries_Recorded_Per_Company.png ~/work/figures/Compensation_By_Years_of_Exp.png                    ~/work/figures/Racial_Makeup_For_Data_Scientist_Roles.png ~/work/figures/compensation_For_Data_Scientists_By_Education.png   ~/work/figures/Top_Companies_For_Data_Scientists.png ~/work/figures/Data_Scientist_Total_Compensation_Distribution.png  ~/work/figures/Total_Compensation_Distribution.png  
	R -e "rmarkdown::render(\"report.Rmd\", output_format=\"HTML_document\")"

report.pdf: .created-dirs ~/work/figures/avg_Data_Scientist_Total_Compensation.png           ~/work/figures/Education_Makeup_For_Data_Scientist_Roles.png ~/work/figures/Avg_Software_Engineer_Total_Compensation.png        ~/work/figures/Most_Common_Job_Titles.png ~/work/figures/Compensation_By_Years_of_Experience.png             ~/work/figures/Number_of_Salaries_Recorded_Per_Company.png ~/work/figures/Compensation_By_Years_of_Exp.png                    ~/work/figures/Racial_Makeup_For_Data_Scientist_Roles.png ~/work/figures/compensation_For_Data_Scientists_By_Education.png   ~/work/figures/Top_Companies_For_Data_Scientists.png ~/work/figures/Data_Scientist_Total_Compensation_Distribution.png  ~/work/figures/Total_Compensation_Distribution.png  
	R -e "rmarkdown::render(\"report.Rmd\", output_format=\"pdf_document\")"
