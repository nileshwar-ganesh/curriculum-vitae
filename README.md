This is a sample format of my CV in latex. The information in the cv has been obfuscated, yet intelligible enough to understand the working of defined commands.

All the relevant information regarding the profile goes into .tex file.

DISPLAY PICTURE : The settings for the display picture cannot be generalized. So some tinkering might be required, before the picture is aligned right. This can be done in .cls file.

Inside "START : DEFINING NEW COMMANDS FOR SIDE BAR" in .cls file, scroll down to the area "now create side bar profile" which starts with a new command - \createsideprofile.

In the sub-section "insert cv picture" tinker with trim, width and the co-ordinates of the circle, until you get the settings right.

COLOR SCHEME : you have options to choose between gray or vanilla. In .cls file, go to the section "USER - SELECT COLOUR SCHEME", to choose your option
