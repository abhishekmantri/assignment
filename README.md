## Problem Statement
Built an app with following functionalities.
##### Login
- User can sign up
- User can login
- User can logout

##### Details of a person
- Add details
- Modify details
- Delete details
- Get all details
##### User can create a Post
##### Post will have following functionalities
- Post verification will be done automatically
- Post will not contain CAPITAL words, this will be verification criteria
# Technology stack used

- Ruby on Rails (backend server)
- MongoDb (backend db)

## Installation

- Clone repo from 
```git clone ```
- Install dependencies
```bundel install```
- Run migrations
```rake db:migrate```
- Run rails server
```rails server```

## APIs

 ### **SignUp User**
> URL: host/signup
	Method: POST  
	Body Params: username, password  
	
>Sample response
```
{
    "_id": {
        "$oid": "5d1dcbf2f589a6639c893970"
    },
    "auth_expiry_time": null,
    "auth_token": null,
    "password_digest": "$2a$10$gmJhqXsZVFRE9qA4AhUM6uMKenPRcShksxD5Z2v72AOMAEIqv39/2",
    "username": "test"
}
```
### **Login User**
> URL: host/login  
	Method: POST  
	Query Params: username, password
	
  > Sample Response
  ```
  {
      "_id": {
          "$oid": "5d1dcbf2f589a6639c893970"
      },
      "auth_expiry_time": "2019-07-05T11:52:56.264Z",
      "auth_token": "Kqo46sUiW6I=",
      "password_digest": "$2a$10$gmJhqXsZVFRE9qA4AhUM6uMKenPRcShksxD5Z2v72AOMAEIqv39/2",
      "username": "test"
  }
  ```
  
 ### **Logout User**
 > URL: host/logout
 	Method: DELETE  
 	
   > Sample Response
   ```
   Logged Out
   ```
   
### **Add a person**
> URL: host/people  
	Method: POST  
	Body Params: name, email, mobile, address
	Headers : Authorization - auth_token
	
  > Sample Response
  ```
  {
      "_id": {
          "$oid": "5d1dffa4f589a60f75737f0b"
      },
      "address": "testing",
      "email": "test1@test.com",
      "mobile": "9632587123",
      "name": "test1"
  }
  ```
  
 ### **Modify a person**
 > URL: host/people  
 	Method: PUT  
 	Body Params: name, email, mobile, address
 	Headers : Authorization - auth_token
 	
   > Sample Response
   ```
   {
       "_id": {
           "$oid": "5d1dffa4f589a60f75737f0b"
       },
       "address": "testing",
       "email": "test1@test.com",
       "mobile": "9632587123",
       "name": "test1"
   }
 ```
 
  ### **View a person**
  > URL: host/people/:id
  	Method: GET  
  	Headers : Authorization - auth_token
  	
    > Sample Response
    ```
    {
        "_id": {
            "$oid": "5d1dffa4f589a60f75737f0b"
        },
        "address": "testing",
        "email": "test1@test.com",
        "mobile": "9632587123",
        "name": "test1"
    }
    
   ### **Delete a person**
   > URL: host/people  
   	Method: DELETE  
   	Headers : Authorization - auth_token
   	
     > Sample Response
    ```
    Success
    ```
  ### **Create a post**
    > URL: host/posts  
    	Method: POST 
    	Body Params: content
    	Headers : Authorization - auth_token
    	
      > Sample Response
     ```
     {
         "_id": {
             "$oid": "5d1dec6af589a66829e69479"
         },
         "content": "Testing the post"
     }
     ```
## Architecture for problems statements
 
 - User can signup, login and logout.
 - User can add details of people, modify, delete, fetch details.
 - User can create a Post with no CAPITAL words in it.
