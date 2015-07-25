## Code Book
# For the Coursera Getting and Cleaning Data Course Project

The following variables exist in the data set `Data_tidy.txt`:

* `SubjectID`: Unique identifier for each participant in the experiment.
* `Activity`: The activity performed by the subject while this measurement was recorded, as a factor variable.
              Levels are `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`
			 
The labels for the quantitative variables are explained in what follows. For a detailed description of what
each measurement corresponds to, see `features_info.txt` in the original Samsung UCI HAR data set.

* `mean...`: Arithmetic means of the origninal measurements, additionally averaged for each subject and activity.
* `std...`: Standard deviations of the original measurements, additionally averaged for each subject and activity.
* `...X/Y/Z...`: Component of the original measurement in X, Y, and Z axial direction.
* `...t/f...`: Is this measurement in the time or frequency domain?
* `...Body/Gravity...`: Is this the component of acceleration due to body movement or the one due to gravity?
* `...Acc/Gyro...`: Does the measurement stem from the device's accelerometer or gyroscope (for angular velocity)?
* `...Jerk...`: The time derivative of the original acceleration or angular velocity measurement.
* `...Mag`: Variable is the magnitude (euclidean norm) of the measurement vector, rather than an its X,Y, or Z component.