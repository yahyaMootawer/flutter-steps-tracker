# flutter_steps_tracker

Flutter Coding Task


## Note

+ the pedometer sesnor is not working in my phone neither on the andorid emulator 
so i created a fake pedometer to emulate the process !

+ this is just a prototype project it needs a lot of refactoring but i didn't have enough time to fix that :-(

+ i didn't handle internet errors or any kind of exceptions ... just handled the exception which is mentioned in the requriments 




## Implemented Requirements

1. Users could be authenticated anonymously, no need to take a phone number or email.   
Upon first installation the app should ask for their name.

2. The application should track the user footsteps and update them in real-time, meaning while the app is in the foreground, and the user walks around, they should be able to see the steps counter increasing.

3. For each number of footsteps taken, a function must run to exchange it to “Health Points”, e.g., 100 footsteps = **1 Health Point**.

4. There should be a history that lists all the exchanges that happened by date and time (*g., “+10 health points on 24 April, 12 AM”),* along with any redemption (e.g., *“-120 health points spent at Starbucks on 25 April, 4 PM”*.

5. Show a visual feedback **(e.g., Snack bar)** when users gain extra points.

6. There should be a catalog of rewards so users can pick a **reward** they like and redeem it. Each reward is linked to one **partner** (e.g., 150 SAR off on Digital Watches from Jarir, or 1 free large coffee at Starbucks).

7. Rewards are paid with health points, feedback should be given upon all cases: if the redemption can happen, show a confirmation dialog, if it cannot due to a low number of points, show an error message stating clearly what’s wrong.

