The purpose of this bash script is to be able to simply convert PDF to MP3


There are a few options such as:

--url
1. Uses `wget` to download a `pdf` file from a page
2. Converts the `pdf` file into a .txt file
3. Uses `text2wave` adn `lame -` to convert the .txt file into a .mp3 file

--pdf
1. Converts the `pdf` file into a .txt file
2. Uses `text2wave` adn `lame -` to convert the .txt file into a .mp3 file

--open
1. Uses `open` on the `pdf` file and `mpv` on the .mp3 file
