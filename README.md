# Capstone Project

## Description
This is the final project I will be making for my bloc courses & it is meant to be the best display of my knowledge & proficiency in coding yet. This project will be an app that sorts, organizes & displays the user's personal collection of pictures. It will store metadata in a local database that will allow the user to *very* easily sort & search through their pictures however they want to. In addition, it will feature a pleasing & robust UI while incorporating external APIs (see User Experiences section) to enhance functionality.

## User Experiences
- Users should be able to sign up, login & see their homepage.
- Users should be able to see & browse their pictures laid out in a pleasing format.
- Users should be able to add a picture from local storage into their collection. *this is too difficult to add to production for now, so we will leave it be for now*
- Users should be able to add/remove tags on images.
- Users should be able to sort & search by tags and other metadata.
- Users should be able to add a picture from the internet into their collection. Said image should be downloaded locally & any existing metadata, if properly attached, should populate the database automatically.
- Users should be able to export their personal database for backup/transfer to a new device.
- App should monitor local files & alert the user if any errors occur between local files & database. *see local files note*
- **Potential Bonus Feature**: Post to social media without leaving the app.
There are a few other features I'm mulling over, but unless I truly want to put the effort in to turn this into a magnum opus, I'll not add them (They'll be added to this readme if I see fit to at least think about including them).

## Styling
- Backgrounds, borders, etc. should be as neutral-colored as possible to draw all attention to the art.
- Dark colors with a brighter border to add separation is the current theme.
- Grayscale for now with the exception of non-nav visited links. Considering changing those to a diff shade of gray in the near future.

## To-do list
- Figure out how to display images in rails.
- Move the alert area to the navbar.
- Create image model (branch: collection).
- Make nav tab collapsable (branch: styling).

## Models
### User
Standard devise user with a name as well. Each user has many images.

### Faq
Faq is just a very basic container for frequently asked questions. It is accessed only by the top-level faq page & exists only to make that page more modular.
- question - string - The Frequently Asked Question.
- answer - text - The answer to the same question chronologically.

### Image
Image is the core model of this project. It will encompass all image files (local, external, picture, art, etc.) for users within the project. Each image belongs to a user.
- title - sting - The title of the image.
- type - enum [picture, artwork, other] - The type of image it is (default: picture).
- uri - string - the path to the file (non-null).
- latitude - float - The latitude where the picture was taken (only matters for picture-type images) (range: -90 to 90).
- longitude - float - The longitude where the picture was taken (only matters for picture-type images) (range: -180 to 180).
- aspect_ratio - float - the aspect ratio (calculated at time of creation, width/height) of the image. for display purposes.
- tags - text - comma-delimited user-added tags for an image.

## Views
### Application (framework)
Should be a navbar on the right. It should collapse with the click of a button such that only a small arrow to expand it back out is showing. There should be an alert area inside the navbar that is a different color & only shows when alert & notice messages are showing.

### Homepage
Should show the User's name, their collection of images, the number of pictures & artworks they have & a sort/filter area. The images should be tiled with a small border around each one & decent spacing in between each. The sort/filter area should have a sort by option which should give the option of sorting by title, type, and aspect ratio (both ascending & descending). It should also allow users to filter by type & tags. Tag filtering should be twofold: show only images with this tag & show all images except ones with this tag. They should work simultaneously. There should also be a link to add a new image in the collection view somewhere.

### Image
A view for just looking at a single image. Should show the image, with a small dashed border, the title, type, location (if present), and any tags associated with the image. The tags should each have an x next to them that, when clicked, deletes the tag via ajax. The image should be sized to fit the viewing area originally, but clicking on the image should show it at native resolution with no other info. And clicking again should toggle back to the normal image view. At the bottom of the normal image view, there should be an area to add tags below the image. Adding tags should also be via ajax. There should also be a link to edit image info somewhere. **Potential Bonus Feature** buttons for posting to facebook & twitter (maybe reddit & pinterest too? We'll see how much tolerance I have for sifitng thru API docs).

### Add image
Standard form page with the following fields:
- title - text field
- location - text field (maps to uri)
- type - dropdown box
- tags - text area

### Edit image
Standard form page with the following fields:
- title - text field
- location - text field (maps to uri)
- type - dropdown box
- tags - text area
- latitude - text field
- longitude - text field

### Map
Should show a google maps API map that shows the locations where the users have taken their pictures.

### User
Devise views: Sign up, edit user, forgot password, edit password, resend confirmation.
