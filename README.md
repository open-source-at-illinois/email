# Email Template for OSAI
To send an email, copy the contents of the email from the previous week and make your desired changes.
Make sure the image references resolve by first sending the email to yourself.

### Sending
You can send email however you'd like.
We use [Ben's emailer utility](https://github.com/benthayer/emailer) to send our emails (click for explanation), but some email clients let you insert raw html into your email, which will also work.
For us, we use Ben's emailer utility to log us in and then we specify a send address of `open-sourceillinois@lists.illinois.edu`, which sends it to our mailing list.
For sending to work, the email must be from an address with permission to send to the list.

### Resolving images
To get the images to update on the server, ssh into root@osai-web.com and pull the changes.

You should be able to just run the following command.
```
ssh root@osai-web.com "cd email && git pull"
```
We have a post-merge hook that copies the `images/` folder from the repo into `/var/www/images`, where nginx will look when it serves links from `osai-web.com/images/*`.
Please note, that this will delete the old images and could potentially break the images on previous emails if the links no longer resolve or if the image dimensions change.

The nginx configuration is located on [our website's repo](https://github.com/thomasdriscoll/open-source-illinois-web). 
