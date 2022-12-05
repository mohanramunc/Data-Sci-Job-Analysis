FROM rocker/verse
RUN R -e "install.packages(\"caret\")";
RUN R -e "install.packages(\"tidyverse\")";
RUN R -e "install.packages(\"scales\")";
RUN R -e "install.packages(\"ggthemes\")";
RUN R -e "install.packages(\"repr\")";
RUN R -e "install.packages(\"remotes\")";
RUN R -e "install.packages(\"reticulate\")";
RUN R -e "install.packages(\"GGally\")";
RUN R -e "install.packages(\"r2d3\")";
RUN R -e "install.packages(\"svglite\")";
RUN R -e "install.packages(\"stringr\")";
RUN R -e "install.packages(\"ggplot2\")";


RUN R -e "install.packages(\"Seurat\")";
RUN R -e "install.packages(\"BiocManager\")";
RUN R -e "install.packages(\"gbm\")";
RUN R -e "install.packages(\"here\")";
RUN R -e "install.packages(\"tinytex\")";
RUN R -e "install.packages(\"rmarkdown\")";
RUN R -e "install.packages(\"shiny\")";
RUN R -e "install.packages(\"plotly\")";
RUN R -e "install.packages(\"data.table\")";
RUN R -e "BiocManager::install(\"GEOquery\");"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"wrapfig\",\"ec\",\"ulem\",\"amsmath\",\"capt-of\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"hyperref\",\"iftex\",\"pdftexcmds\",\"infwarerr\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"kvoptions\",\"epstopdf\",\"epstopdf-pkg\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"hanging\",\"grfext\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"etoolbox\",\"xcolor\",\"geometry\"))"
RUN Rscript --no-restore --no-save -e "install.packages(c(\"plumber\"))"
RUN Rscript --no-restore --no-save -e "install.packages(c(\"verification\"))"
RUN Rscript --no-restore --no-save -e "update.packages(ask = FALSE);"
RUN R -e "BiocManager::install(\"cowplot\");"
RUN R -e "BiocManager::install(\"patchwork\");"
RUN R -e "BiocManager::install(\"limma\");"
RUN R -e "BiocManager::install(\"openxlsx\");"
RUN R -e "BiocManager::install(\"ggplot2\");"
RUN R -e "BiocManager::install(\"knitr\");"
RUN R -e "BiocManager::install(\"MAST\");"
RUN R -e "BiocManager::install(\"mclust\");"
RUN R -e "BiocManager::install(\"matrixStats\");"
RUN R -e "BiocManager::install(\"ggpubr\");"
RUN R -e "BiocManager::install(\"SingleCellExperiment\");"
RUN R -e "BiocManager::install(\"pheatmap\");"