# ASP.Net-CSharp-JQuery_PracticeWebApp
A practice web application that mimics an Online Banking Site.

####Overview
This is a project I am working on to expand and better develop my ASP.net/C# skills. Most of the web pages are templates. I created a small
 database to store user information into 4 tables: Users, Accounts, Transactions, ContactMessages. This project is 
 definitely in its early stages! 

####Features
* User can log in.
* Account page displays user's information retrieved from the database.
* Feedback page allows users to leave comments! Comments are stored and read from a XML file. Name textbox uses a required field validator while the comment box uses JQuery to make sure the user doesn't submit a message.
* Contact page allows users to email any concerns, problems, or suggestions. Emails are stored in a ContactMessages table in the database. Textboxes have required field validators and the email textbox uses a regular expression validator!
* Registration page allows new users to register for an account. Registration form validates all textboxes, checks if a user name already exists, and inserts the new information into the database. 
* Forgot Password page allows existing users to change their password only if the user name and email combination exists in the database! **[MOST CURRENT]**
 
####WIP
 * Allow existing users to update their password in their account page.
 * Add content to the About page.
  - About: General description of the purpose of the website
* Format elements to make the site look "prettier" and more appealing to the eye!
  
####Screenshots
![alt tag](https://lh3.googleusercontent.com/lt6wXkHoQsCPV2FzVZlDjo1u95xUpEcB0nMElG1HJeI=w863-h934-no)
![alt tag](https://lh3.googleusercontent.com/a9218scPcidHBrSWTBVU0vPTiCp5sFu6zRuSj4HPG9k=w863-h934-no)
![alt tag](https://lh3.googleusercontent.com/cpMSyKO5iyR0Xc9OnuwQeBvtuJkRFxuco0H4YLRJKWU=w863-h934-no)
![alt tag](https://lh3.googleusercontent.com/YbH6Gc2QpJA06GAdmD-gfTIW2IhKlq8OtjflLcA-Aps=w863-h934-no)
![alt tag](https://lh3.googleusercontent.com/xW1uIJhVbEl8Lh1wDI0phPuCyjrqxhfZUXBY4he-Zr8=w863-h934-no)
![alt tag](https://lh3.googleusercontent.com/wbMsWLcUBz89qbPV0p5sWpWlkjAbjU81ZVCbR5glsiE_aSPTSYe3e5VRMqb86Fn8TUKsuSOpOoW-Q73vX91oVRtOGisZ6MhKgUeWPNdNW-gkTunIk2VLlk85C_kYkXAOi2fLfF3vQFGFrsqm4-LPbOBOVi4edhoLRg4RW1jXgTvTXcRAN28uBM0QF8SXeS0jqqW-F76Ot3aV_Wk8HaK3I7eKacsME2i_gEGZ1xUzCuzwavkCf29ZJOpJFDNQNMjDfZaGBnofjGHKsG3xVxRlB73SrQ0JkPcrhLHtoZcXtVdfPiKuoEfhSp_xflzhRYy2Z-Dea7bNUNNqp2OsYP321u4OMMfbU8Hrf2WiBXtUKLCsLhkxGUWG-KfEsYUdH_BaoQZxzwz80-jjkVqHELjOPZgh_z_9aiNgEjj8aFlor-T749IgjC0AkVNx_NkJGxqEzA_7QTj-thKIDoe4WqLPekWLfhaLYBgZ4KOvhn2xL3FDwvqUR6G-fDTNtBOLAS8W1z7qWpEhge3MQSbUwOD6BjI=w882-h955-no)
![alt tag](https://lh3.googleusercontent.com/eFXrZreiOCA8fIcaPAw2XdpNHLOTBKW6p1kjyH4v9Ixf5S88dpp4VZjp6JKmmeQ77H41X-0aKF0lph6JKefAurQ84AY_NufKwb66Ot7KwxWChQi8Zz2Pp4KOB4S9fDVysaVC_gQMDnynBlBYP4iCzcDmtkfMHfrwgjbqebCew4vX7WmDUEZDU9fWwJIpDf9MSQROujaeZybsFLSoiwx9HlzM3GHUfwbLPkIvL4MzVK8g7Y7Mkr42iuBbirgGo0zlLBjCUurBPTFj_uEMVaYJz-KNJkM0JkFTA8qNVfAFkvHEOzSc6VVpk-rcvwk64Iiin4pY7uzALzGkuyO8N21pWz_cw3lndfSYHJlpGr7C0gdgD9YjJA8JrxFztttgeNcAOEo0ND9vWOCg8zJ0dNNXO0w5oGVm_BUNydoVvZWVrpgO9POOuK98sJxH-WxJiwygDub7WBS1j12u1_4nLvLxdYuh8x13HAwOkLiaeN7WD1jE8vzk4rKucYXcXGTwxjiN6vEnghsfJLHAgdVwb9znKrc=w882-h955-no)
![alt tag](https://lh3.googleusercontent.com/0r8Wf1ST1RWTQi8aW0ATTp1oj95WRvRgCQJz0fxT6uNSmjo5ul1AbXHYHLjWCha155bcDooUJYPyZmvqnqYqAkASLtE784d-b7GUYbYMOH2_oTXp2VIMi8KWceKCugPIkG6jlraM9MtRrjdvQsNtCqRPutKU63PeEORdTpTb4uBZusFn8XyNTpA1yHIr5SVGU7eDjvCRdWmLeKuPdijISLwhHAA_iFG7vIKMTm1k55Y9jFhiGg7-tSvvJ__ekX59HF2NyYcY-WnOtWZn0WyJcGxmf1O6vHHYfSc5L-UBnq3u-s3KMmJPJJVYf5fqZtlAoKca0pGcZTkrpxrkNFq9e0KDELFm8_IbAQ6-WsclDoaCaI0K9TVDcUAIGCK997RjKlbjZhk9twPaB2P-ZQ9U5ZeLxeQqfOqCHNQir4sppkCK2nedP2ZaAumOhBsvpT0WTBjMeJMiPZLJimveKZWfULICNV27sAE5JyyDOR96jWrqD4zyXCVlAxN4zmEY8P3RQe-X9L8X_hHcIp1uncnCD8w=w882-h955-no)
![alt tag](https://lh3.googleusercontent.com/Ioy1_5hmqOBR9P6fJxjgSGk4UQxvpMGTnJY5wMix8P0Lh6Wwztr3T3773CGLKgAk0P1DQluMOxb5SbOgOIDt7M3rXlvuzwmG64krHiLJs6Z-CMlQtF89ncidPFolmB9z0a3beeyZE3Ob4iCM5ShiohSys0sDt44FvhLwXEv70B-5xuhLyBRszh6OtFJXaKT256HrMwgQgAaydLggD51NemLQL4ba4UKjp-bOIlJhws-ZVdCUwloZsyrYWWEighpARoyALpuQDrCz84r2VZ47jfgUgrr7g4zMmpEDyUrcqFaTQ_Cfz0DoC3g0_ZIsorrZk_3YD_tu39t9SNd1w1Udu8eEHgcqv79kn0JU94C-oAO1zPvkEL-QT92zB8KnNy1PVefG1XQGKdQlW2cZjEd5_z7dd34VKy9jeSBwcyNZvzFk_ooDN3WtWX1XMV-pKrO7lWSjEVfmNDku2Fk9jcZoLSI8HxvZU5RKb4EfNaIhcrrGCGoFOPJ5KMLAXCTQMG5KIKm13BuUeEb7GgAhNa3lP8A=w882-h955-no)
