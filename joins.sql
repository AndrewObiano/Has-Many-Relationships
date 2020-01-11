-- 1
SELECT *
FROM users;

-- 2
SELECT *
FROM posts
WHERE user_id = 100;

-- 3
SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE user_id = 200;

-- 4
SELECT posts.*, users.username
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- 5
SELECT users.username
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE posts.created_at > '2015-1-1';

-- 6
SELECT posts.title, posts.content, users.username
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE users.created_at < '2015-1-1';

-- 7
SELECT comments.*, posts.title AS post_title
FROM comments
INNER JOIN posts ON comments.post_id = posts.id;

-- 8
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at < '2015-1-1';

-- 9
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at > '2015-1-1';

-- 10
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%USB%';

-- 11
SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
INNER JOIN users ON posts.user_id = users.id
WHERE comments.body LIKE '%matrix%';

-- 12
SELECT users.first_name, users.last_name, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
INNER JOIN users ON comments.user_id = users.id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

-- 13
SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name, posts.title AS post_title, users2.username AS comment_author_username, comments.body AS comment_body
FROM posts
INNER JOIN users ON posts.user_id = users.id
INNER JOIN comments ON comments.post_id = posts.id
INNER JOIN users AS users2 ON comments.user_id = users2.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';

-- Test commit