# FlutterWorkoutApp
Flutter application which will allow me to record my workouts and have them be recorded to a google sheets document.

This will be a pretty simple app. The main goals and features I hope to impliment are:

Allow the user to set up their work outs to be selected from a dropdown.
Allow the users to log data about how many sets at what weight were done.
Ensure that the data logged is recorded to a googlesheets document based on date, weight, number of sets, number of reps per set.
Cardio options.

Optional features:

Histographs by exercise to see change over time.
Streak bonuses.
Not a horrible UI.


update:

will be using sqflite to record each type of workout, and each one has a guid on it. these will be how items are added to the database. currently, i am not sure how i will handle removing set entries. 
