blogplus
========

* An enhanced RoR demo based on the blog example from RailsGuides (Rails 4.0.3.
* RailsGuides is available here: [.RailsGuides](http://guides.rubyonrails.org/)

Enhancements:
-------
* Seed the parent-child tables(See db/seeds.rb);
* Add some specification on page app/views/welcome/index.html.erb;
* Use HTML table to display both the posts and the comments in the view;
* Set the HTML text area to display in 6 rows;
* Add comment showing/editing support;
* Add a comment counter (index) using the partial's undocumented method _counter (0-indexed);
* The links are clearer than the original version, such as 'Back to Posts' instead of 'Back';
* Add more comments and pointers where necessary.
* Use gem will_paginate-bootstrap to paginate on May 5, 2015.

Miscellaneous:
-------
* The original user/password is in file blogplus_user_password.txt.
* Good reference articles are listed in file Nested-resources-with-independent-views-in-Ruby-on-Rails.txt.
* Both the above files reside in the project root folder.
