# Bookmark Manager
A web app that stores web bookmarks in a database.

## Installation

### Create new database
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`

### Create a new test database
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager_test;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`

## How to Use

## User stories
1. Show a list of bookmarks
``` 
As a user,
So that I can keep track of my saved bookmarks,
I'd like view a list of saved bookmarks. 
```

![Screenshot 2022-03-14 at 14 23 43](https://user-images.githubusercontent.com/74867241/158192288-2add26fc-3323-49d6-8257-1676ac7cf8c6.png)

2. Add new bookmarks

``` 
As a user,
So that I can access websites I find on the internet,
I'd like to add them to my bookmark list. 
```


3. Delete bookmarks
4. Update bookmarks
5. Comment on bookmarks
6. Tag bookmarks into categories
7. Filter bookmarks by tag
8. Users are restricted to manage only their own bookmarks




