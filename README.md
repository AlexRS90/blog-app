![](https://img.shields.io/badge/Microverse-blueviolet)
![](https://img.shields.io/badge/Ruby-red)

# Blog App

> 

## Milestone 1:

✅ Created a new rails app. <br>
✅ Followed gitflow <br>
✅ Setup PostgreSQL database. <br>
✅ For each URL I created: 
 - A route.
 - Action in the correct controller.
 - A view file.

## Milestone 2:

✅ Add RSpec as a gem to your project. <br>
✅ Create a Request spec file for all your controllers. <br>
✅ Make sure that for each action you check: <br>

 - If the response status was correct.
 - If a correct template was rendered.
 - If the response body includes correct placeholder text.

## Milestone 3:

✅ Wrote commands to create new models and their migrations. <br>
✅ Wrote commands to generate schema.rb <br>
✅ Added foreign keys with their indexes. <br>

## Milestone 4:

✅ Added some records to the database. ✍️ <br>
✅ Wrote some methods to update the database counters. 🔢 <br>
✅ Used seeds.rb and rails console. 🌱 <br>

## Milestone 5:

✅  Implemented the design from the sneak peek wireframes. 🖥️  <br>
✅  Added basic styling 🎨  <br>
✅  Used methods from models. 📈  <br>
✅  Used partials to keep the code DRY 🏜️  <br>

Milestone 6:

✅  Create forms to perform the following functions: <br>
      ✔️  Creates a Post on behalf of the current_user. 📄 <br>
      ✔️  Create a comment on behalf of the current_user. ✍️ <br>
✅  Allow Users to add likes to Posts. 👍 

## Built With

- Ruby On Rails

## To get a local copy up and running follow these simple example steps.

Open your termnial and run the following command:

<code>git clone https://github.com/AlexRS90/blog-app.git</code>
 - cd blog-app
 - bundle
 - rails db:create
 - rails db: migrate

### Now we need initial users in order to start working with the blog app, let's added, run the following commands:

 - rails c
<code>User.create!(name: 'Alex', photo: 'https://lh3.google.com/u/0/d/1Rf6vRehHE5NqXss9gvR8Xh2KCCKcZR3n=w1440-h789', bio: 'Full-Stack Web Developer')</code>
<code>User.create(name: 'Tom', photo: 'https://media.istockphoto.com/photos/young-handsome-man-with-beard-wearing-casual-sweater-standing-over-picture-id1212702108?k=20&m=1212702108&s=612x612&w=0&h=ZI4gKJi2d1dfi74yTljf4YhulA1nfhD3dcUFGH-NUkY=', bio: 'Teacher from Mexico.')</code>
<code>User.create(name: 'Lilly', photo: 'https://media.istockphoto.com/photos/cute-and-happy-teen-girl-with-braces-smiling-to-camera-picture-id1299140003?k=20&m=1299140003&s=612x612&w=0&h=c9d6mpWwHv1pgYg1vhSHlnA4GGUoS982oyrcdtHmrtI=', bio: 'Teacher from Poland.')</code>
Now that we have users, you can start the server with the following comand:
 - <code>rails s</code>
Open your browser and type the following URL <code>http://127.0.0.1:3000/</code>

Finally you can start using the app and add some post, comments and likes.
Enjoy!

### Prerequisites

- Ruby
- Terminal

## Author

👤 **Alejandro Ramos**

- GitHub: [@AlexRS90](https://github.com/AlexRS90)
- Twitter: [@AlejandroRBenji](https://twitter.com/AlejandroRBenji)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!


## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.