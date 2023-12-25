Chances are, you have MySQL running somewhere in your data center. If that's the case, there might be a time when you need to set or change the root user password. This can happen when you've forgotten the password or when you're looking to up your security game (remembering you set the original MySQL password to something far too simple).

As you might expect, the process is handled entirely through the command line and works with with either MySQL or MariaDB installations. The Linux distribution being used doesn't matter (as long as you have admin access, either by way of su or sudo).

SEE: 20 quick tips to make Linux networking easier (free PDF) (TechRepublic)

A word of warning: Given the current state of attacks, across the landscape of IT, I highly recommend you using seriously strong passwords for your databases. Use a random password generator and then store that in a password manager (instead of using an easily memorized password). Be safer than safe.

With that said, let's get to work.


Setting the password for the first time

Do note, throughout this article, I will refer to MySQL, with the idea that everything will work for both MySQL and MariaDB.

Typically, during the installation of MySQL and MariaDB, you are asked to set an initial password. If, for whatever reason that didn't happen, you will need to set a password for the first time. To do that, open up a terminal window and issue the following command:

```
mysqladmin -u root password NEWPASSWORD
```
Where NEWPASSWORD is the password to be used. Now, when you log into MySQL, with the command mysql -u root -p, you will be prompted to enter the newly configured password.

An alternative method for setting the root password for the first time, one that also adds a bit of security to your MySQL database, is to use the mysql_secure_connection command. Not only will this command set the root user password, but it will allow you to remove anonymous users, disallow remote root login, and remove the test database. To use this command, simply type:

```
mysql_secure_connection
```
Answer the presented questions and your password will be set (as well as your database being a bit more secure).

SEE: Password management policy (Tech Pro Research)


Changing the MySQL root user password

To reset the password for MySQL you first must create a new file with the following contents:

```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'PASSWORD';

```
Where PASSWORD is the new password to be used. Save that file as ~/mysql-pwd.

Next, stop the MySQL daemon with the command:

```
sudo systemctl stop mysql
```
With the daemon stopped, issue the command:

```
sudo mysqld -init-file=~/mysql-pwd
```
Once your command prompt is returned, restart the MySQL daemon with the command:

```
sudo systemctl start mysql
```
You should now be able to log into the MySQL command prompt with the new admin password like so:

```
mysql -u root -p
```
When prompted, type the admin password and you're good to go.


Recover your MySQL password

What if you've forgotten your MySQL root user password? This could be quite the predicament ... had the developers not thought of that eventuality. In order to recover the password, you simply have to follow these steps:

1. Stop the MySQL server process with the command sudo service mysql stop
2. Start the MySQL server with the command sudo mysqld_safe --skip-grant-tables --skip-networking &
3. Connect to the MySQL server as the root user with the command mysql -u root
At this point, you need to issue the following MySQL commands to reset the root password:

```
mysql> use mysql;
mysql> update user set authentication_string=password('NEWPASSWORD') where user='root';
mysql> flush privileges;
mysql> quit
```
Where NEWPASSWORD is the new password to be used.

Restart the MySQL daemon with the command sudo service mysql restart. You should now be able to log into MySQL with the new password.

And that's it. You can now set, reset, and recover your MySQL password.

SEE: The cloud v. data center decision (ZDNet/TechRepublic special report) | Download the free PDF version (TechRepublic)


A second warning

Just to be certain, I wanted to remind you how important it is to set a very difficult password for the MySQL root user. Those databases hold sensitive information, so the last thing you need is to make use of a weak password that can be easily cracked. Use a long password that you cannot memorize and store it in a password vault. You'll be glad you did.
