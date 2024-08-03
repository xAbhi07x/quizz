# my runapp takes the Quiz widget as the root widget

# QUiz widget, i made it an statefulWidget because i have to keep updating the internal state (i have to keep displaying different question and different answer options)

# basically i have also to switch between 3 screens which is startingScreen & QuestionsScreen & ResultScreen.

# Quizapp should return the screen that i want to display and it should also return a common background for all of the screen.

# How do i render different screen? - I do it by using the if else and setting the activeScreen value. if the activeScreen value is set to 'question_screen' then i would use the set_state funtion to basically reload the build method which will now return the Widget of question_screen.

# question screen class has to be stateful too as it keeps updating the question and the starting screen and result screen need to be stateless

#