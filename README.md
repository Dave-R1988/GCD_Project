## GCD_Project
# Coursera Getting and Cleaning Data Course Project

The R script `run_analysis.r` tidies up the Samsung UCI HAR data set. It assumes your working
directory ends in `/UCI HAR Dataset`. For a description of the original data set and the experiment 
performed, see `readme.txt`. 

The script loads both the training and test datasets from 
`test/X_test.txt` and `train/X_train.txt` and combines them into a single data frame. Variable
labels are slight variations of the ones found in `features.txt` (see `CodeBook.md` for details),
and only the means and standard deviations of the original measurements are used, i.e. only
original variables whose names contain `mean()` or `std()` are preserved, resulting in 66 variables.

Once the data has been merged, variables for subject ID and activity are added using `test/subject_test.txt`,
`train/subject_train.txt` and `activity_labels.txt`. Again, see the code book for details.

Lastly, all measurements are (arithmetically) averaged by subject ID and activity, i.e. we end up with
a single data point per subject per activity, resulting in 30 (subjects) x 6 (activities) = 180 observations
of 68 variables (including ID and activity labels). The data is then saved as `Data_tidy.txt` with 180 rows
and 68 columns.
