CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    caption TEXT,
    image_url VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    like_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Followers (
    follower_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    follower_user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (follower_user_id) REFERENCES Users(user_id)
);



-- Inserting into Users table
INSERT INTO Users (name, email, phone_number)
VALUES
    ('John Smith', 'johnsmith@gmail.com', '1234567890'),
    ('Jane Doe', 'janedoe@yahoo.com', '0987654321'),
    ('Bob Johnson', 'bjohnson@gmail.com', '1112223333'),
    ('Alice Brown', 'abrown@yahoo.com', NULL),
    ('Mike Davis', 'mdavis@gmail.com', '5556667777');

-- Inserting into Posts table
INSERT INTO Posts (user_id, caption, image_url)
VALUES
    (1, 'Beautiful sunset', '<https://www.example.com/sunset.jpg>'),
    (2, 'My new puppy', '<https://www.example.com/puppy.jpg>'),
    (3, 'Delicious pizza', '<https://www.example.com/pizza.jpg>'),
    (4, 'Throwback to my vacation', '<https://www.example.com/vacation.jpg>'),
    (5, 'Amazing concert', '<https://www.example.com/concert.jpg>');

-- Inserting into Comments table
INSERT INTO Comments (post_id, user_id, comment_text)
VALUES
    (1, 2, 'Wow! Stunning.'),
    (1, 3, 'Beautiful colors.'),
    (2, 1, 'What a cutie!'),
    (2, 4, 'Aww, I want one.'),
    (3, 5, 'Yum!'),
    (4, 1, 'Looks like an awesome trip.'),
    (5, 3, 'Wish I was there!');

-- Inserting into Likes table
INSERT INTO Likes (post_id, user_id)
VALUES
    (1, 2),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 5),
    (4, 1),
    (4, 2),
    (4, 3),
    (5, 4),
    (5, 5);

-- Inserting into Followers table
INSERT INTO Followers (user_id, follower_user_id)
VALUES
    (1, 2),
    (2, 1),
    (1, 3),
    (3, 1),
    (1, 4),
    (4, 1),
    (1, 5),
    (5, 1);



SELECT * FROM comments;
SELECT * FROM followers;
SELECT * FROM likes;
SELECT * FROM posts;
SELECT * FROM users;


-- Updating the caption of post_id 3

UPDATE posts
SET caption = 'Best Pizza Ever'
Where post_id = 3;

-- Selecting all the posts where user_id is 1

SELECT * FROM posts
WHERE user_id = 1;

-- Selecting all the posts and ordering them by created_at in descending order

SELECT * FROM posts
ORDER BY created_at DESC;

-- Counting the number of likes for each post and showing only the posts with more than 2 likes

SELECT p.post_id, COUNT(l.like_id) AS number_of_likes FROM posts AS p
JOIN likes AS l ON p.post_id = l.post_id
GROUP BY p.post_id
HAVING COUNT(l.like_id) > 2;

-- Finding the total number of likes for all posts

SELECT SUM(number_of_likes) FROM (
SELECT p.post_id, COUNT(l.like_id) AS number_of_likes FROM posts AS p
JOIN likes AS l ON p.post_id = l.post_id
GROUP BY p.post_id) AS likes_by_post;

-- Finding all the users who have commented on post_id 1
SELECT name FROM users WHERE user_id IN(
SELECT user_id FROM comments
WHERE post_id = 1);


-- Ranking the posts based on the number of likes

WITH cte AS(
SELECT p.post_id, COUNT(l.like_id) AS number_of_likes FROM posts AS p
JOIN likes AS l ON p.post_id = l.post_id
GROUP BY p.post_id)

SELECT post_id, number_of_likes,
RANK() OVER(ORDER BY number_of_likes DESC) as rank_by_likes
FROM cte;


WITH cte AS(
	SELECT p.post_id, p.caption, c.comment_text FROM posts AS p
	LEFT JOIN comments AS c ON p.post_id = c.post_id
)

SELECT * FROM cte;


-- Categorizing the posts based on the number of likes

WITH cte AS(
SELECT p.post_id, COUNT(l.like_id) AS number_of_likes FROM posts AS p
JOIN likes AS l ON p.post_id = l.post_id
GROUP BY p.post_id)

SELECT post_id, 
CASE WHEN number_of_likes < 2 THEN 'low likes'
WHEN number_of_likes = 2 THEN 'few likes'
WHEN number_of_likes > 2 THEN 'lots of likes'
ELSE 'No Data'
END AS like_category
FROM cte;

-- Finding all the posts created in the last month

SELECT * FROM posts
WHERE created_at >=CAST(DATE_TRUNC('month', CURRENT_TIMESTAMP - INTERVAL '1 month') AS DATE);

