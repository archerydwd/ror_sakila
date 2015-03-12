# Ruby on Rails ror_sakila Application

Please note this is not a tutorial, I have wrote it in that style so you can follow along. If you get into trouble (like I did) try the mailing list or just google it. You will find that you will actually learn more from researching it and getting into tight spots. ;) 

I built this app with the Ruby on Rails framework to be used as part of a series of applications that I will be 
performing tests on. This is a Ruby on Rails version of the Chicago Boss cb_sakila application: 
https://github.com/archerydwd/cb_sakila & the Flask version is here: <INSERT-LINK>

I am going to be performing tests on this app using some load testing tools such as Gatling & Tsung. 

Once I have tested this application and the other verisons of it, I will publish the results, which can then be used as a benchmark for others when trying to choose a framework. 
You can build this app using a framework of your choosing and then follow the testing mechanisms that I will describe and then compare the results against my benchmark to get an indication of performance levels of your chosen framework.

=
###Installing Ruby and Rails

At time of writing this the Ruby version was: 2.2.0 and the rails version was: 4.2.0.

Use RVM, the Ruby Version Manager: https://rvm.io, to install Ruby and manage your Rails versions.
If you are using osx then there is a system version of Ruby, which will more than likely be out of data. Use RVM to install Ruby and the “system Ruby” will remain on your system but the RVM version will take precedence when calls are made to Ruby.

```
\curl -L https://get.rvm.io | bash -s stable --ruby
```

* If you are using a mac and your user name includes a space, you need to change it to remove the space. Directions on apple support site: http://support.apple.com/en-us/HT201548.

* If you have any problems, check that your xcode version is up to date and make sure to open it and accept the licence too. Also you need to install the xcode command line tools: 

```
xcode-select --install
```

If you have RVM installed you can update it and then install Ruby.
```
rvm get stable --autolibs=enable
rvm install ruby
rvm --default use ruby-2.2.0
```

Use the following to update the gem manager:

```
gem update --system
```

To install the latest version of Ruby on Rails and check the version afterwards:

```
gem install rails
rails -v
```

=
###Working with the existing database

Firstly I am creating this application with the sakila_dump.sql file, which you can get from here: https://github.com/archerydwd/ror_sakila/blob/master/sakila_dump.sql. Its included in the source for this repository.

**Install mysql**

We are going to be using mysql for this database. If you don't have it, please install it:

Using HomeBrew on OSX:

```
brew update
brew doctor
brew upgrade
brew install mysql
```

Using apt-get on Ubuntu:

```
sudo apt-get install mysql-server
```

Enter a password when prompted, I will use 'password' for the purposes of these instructions.

start the server on osx:

```
mysql.server start
```

start the server on linux:

```
sudo etc/init.d/apache2 start
```

**Create the database**

To create the database, we need to login and enter a few commands. Please note, if this is your first time using mysql, the first time you login and enter a password, this acts as setting a password. If you don't want to set a password (bad idea) just hit enter when it requests the password.

```
mysql -u root -p
create database ror_sakila;
use ror_sakila;

source PATH/TO/sakila_dump.sql
```

Then to check that this has indeed worked, you can enter the following command and you should see a list of the tables in the database:

```
show tables;
```

=
###Building the ror_sakila application

**Create the ror_sakila app**
```
rails new ror_sakila -d mysql
cd ror_sakila
```

The -d flag sets the application to use mysql as the database.

**Starting the development server**

To start the dev server:
```
rails server
```

To stop the development server:
```
ctrl + c
```

**Point the app to the database**

Edit: config/databases.yml

Change database to ror_sakila under the development & production headers, as we are not actually deploying this app, so there is no need for two seperate databases. We will also change the production username to root and the password to password.
```
development:
  <<: *default
  database: ror_sakila
  
production:
  <<: *default
  database: ror_sakila
  username: root
  password: password

```

Change the username to root (or whatever username you have set up) and the password to password under the default header:

```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  password: password
  socket: /tmp/mysql.sock
```

**Generate the database schema**

Ok, we now want to generate a database schema. We are doing this to prove that the app is connecting to the database and to provide a schema for our scaffold to use. 
Scaffold is a gem that simply produces the generator commands that we need in order to build the application. It uses the database schema in order to do this (this really is just a time saver so we don't have to look at the table names and get the field names etc..). This is the best way to build an application for an existing database that I have found.

Generate the schema:

```
rake db:schema:dump
```

Install the gem for schema_to_scafford.

```
gem install schema_to_scaffold
```

Then once this is installed, we can simply type:

```
scaffold
```
Then select 0 as the path, hit enter and then * for the tables and hit enter.
It will then produce generator commands for us to use. Copy these commands to a text file and input them one at a time into the terminal (inside your applications directory).

**Create a home controller and index page**

Now we need to provide a page that links the others that the generator created together.

```
rails generate controller home index
```

Then edit: app/views/home/index.html.erb

```
<h1>Index page</h1>
<ul>
  <li><%= link_to 'Actors', actors_path %></li>
  <li><%= link_to 'Addresses', addresses_path %></li>
  <li><%= link_to 'Categories', categories_path %></li>
  <li><%= link_to 'Cities', cities_path %></li>
  <li><%= link_to 'Countries', countries_path %></li>
  <li><%= link_to 'Customers', customers_path %></li>
  <li><%= link_to 'Film Texts', filmtexts_path %></li>
  <li><%= link_to 'Films', films_path %></li>
  <li><%= link_to 'Inventories', inventories_path %></li>
  <li><%= link_to 'Languages', languages_path %></li>
  <li><%= link_to 'Payments', payments_path %></li>
  <li><%= link_to 'Rentals', rentals_path %></li>
  <li><%= link_to 'Staffs', staffs_path %></li>
  <li><%= link_to 'Stores', stores_path %></li>
</ul>
```

Then we need to set the root route to the home/index page, so edit: config/routes.rb and enter:

```
root 'home#index'
```

Start the development server:

```
rails server
```

You can now navigate to: http://localhost:3000/ and you should see the index page with links to all the other pages.

If you get an error about a javascript include tag, do the following:

```
vim Gemfile
```
And uncomment the line that has 'therubyracer' in i, then run:

```
bundle install
```

Now try again.

=
###Getting Production Ready

The following changes must be made in order to have the application in a production environment ready state.

**Add A Secret Key**

We need to add a secret key for production mode, this can be done by changing directory to the railsblog and running the following command:

```
rake secret
```

If this does not work, then please run:

```
bundle exec rake secret
```

The above command will produce a secret key. Copy this key and place it in as a production key in: config/secrets.yml

```
development:
  secret_key_base: 05215a3d1a1dd8648f7c6ee3c333778e5c99cb9115fdf313f1ee79b276008dd32d36817dc60bded89d3eb7d679797096758ae2667c08ff756e234851016296ed

test:
  secret_key_base: 5b3e49d01fe19e183c7c5d4a758352071cf581d1192f9c3c137f99e8c383436f3cc99893bf1fb34a8140c17cfdebfce67e44ea64ba25c85cdee8cb72d5a9512f

production:
  secret_key_base: 5ec6914064c1f8ebf3fe3e0ccb29351240db088138e68462f2067582066a3e6bba48792b41ec22193567893f5638a564f9c44a6bdceeb9083ba6b6f74ae0eba8
```

In the normal use case this secret key should be placed in an environment variable and read in here. For us this is not necessary as we are not deploying a release of the application.

**Change The Production Database**

In the normal development use case you should have a seperate database for development, testing and production. In our example we can use the development database for production as we are not building a product for general release but rather for testing purposes. In saying that we now need to rename the production database to our mysql database, as per the following: config/database.yml:

```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  password: password
  socket: /tmp/mysql.sock

development:
  <<: *default
  database: ror_sakila
  
test:
  <<: *default
  database: ror_sakila
  
production:
  <<: *default
  database: ror_sakila
  username: root
  password: password
```

**How To Run In Production Mode**

To start the app in the production mode issue the command:

```
rails s -e production
```

=
###The End

Thanks for reading, hope you learned something. :)

Darren.
