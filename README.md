# Ruby on Rails ror_sakila Application

I built this app with the Ruby on Rails framework to be used as part of a series of applications that I will be 
performing tests on. This is a Ruby on Rails version of the Chicago Boss cb_sakila application: 
https://github.com/archerydwd/cb_sakila.

I am going to be performing tests on this app using some load testing tools such as Tsung, J-Meter and Basho bench. 

Once I have tested this application and the Chicago Boss verison of it, I will publish the results, which can then be used as a benchmark for others to use when trying to choose a framework. 
You can build this app using a framework of your choosing and then follow the testing mechanisms that I will describe and then compare the results against my benchmark to get an indication of performance levels of your chosen framework.

###Installing Ruby and Rails

At time of writing this the Ruby version was: 2.2.0 and the rails version was: 4.2.0
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

**Create the ror_sakila app**
```
rails new ror_sakila
cd blog
```

###Building the application

**Starting the development server**

To start the dev server:
```
rails server
```

To stop the development server:
```
ctrl + c
```

**HERE**

