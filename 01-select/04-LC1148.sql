-- you need to find all authors who viewed at least one of their own articles (author_id = viewer_id), returning the unique author IDs sorted in ascending order.

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;