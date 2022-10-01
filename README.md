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


## Screenshots

<table>
  <tr>
    <td>Login Page</td>
     <td>Steps counting page</td>
     <td>Products Catalog</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422709-9b4cd9e7-53ca-45db-9b64-3cdd9f78d63e.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422710-eefd1ad0-f00f-445c-b8db-16d0dd44a456.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422712-4e6eac6d-3489-434c-8b65-3d482ad30115.png" width=270 height=480></td>
  </tr>
 </table>

<table>
  <tr>
    <td>No enough points to exchange !</td>
     <td>Snackbar to indicate gaining points </td>
     <td>an entry of gettting points </td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422714-2d3e0bc0-bbb2-46c6-be4b-88645cb4e6eb.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422716-7c6cfd37-8bb9-4bb5-b40b-5792d9b0ec73.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422718-102ba789-2c92-4d2b-b60c-b5d0ab8f4f3c.png" width=270 height=480></td>
  </tr>
 </table>
 
 
 
<table>
  <tr>
    <td>Confirm to exchange </td>
     <td>an entry to indicate exchaning a reedem</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422719-0af29f59-52f7-4c6b-a313-a91a4b316e36.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/114827469/193422720-f57e0d71-80c4-41f8-852c-08c6e5aca503.png" width=270 height=480></td>
  </tr>
 </table>



