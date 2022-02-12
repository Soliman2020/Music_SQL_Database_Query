/* Who are the best customers? */

SELECT 
	c.CustomerId ,
	c.FirstName ,
	c.LastName ,
	SUM(i.Total) AS "Total Spending"
FROM Customer c 
JOIN Invoice i 
ON	i.CustomerId = c.CustomerId 
GROUP BY i.CustomerId
ORDER BY 4 DESC 
LIMIT 10;

------------------

/* Top 10 Rock Musicians */

SELECT 
	DISTINCT a.ArtistId ,
    a.Name ,
	COUNT(a.ArtistId) AS 'Songs'
FROM Artist a 
JOIN Album b ON a.ArtistId = b.ArtistId 
JOIN Track t ON b.AlbumId = t.AlbumId 
JOIN Genre g ON g.GenreId = t.GenreId 
WHERE g.Name = 'Rock' 
GROUP BY 2
ORDER BY 3 DESC
LIMIT 10 ;

----------------------

/* The Most Earned Artist */

SELECT 
	a.ArtistId ,
	a.Name	,
	ROUND ( SUM((l.Quantity)*(l.UnitPrice)) ,1 ) AS 'AmountSpent'
FROM Artist a 
JOIN Album a2 ON a.ArtistId = a2.ArtistId 
JOIN Track t ON a2.AlbumId = t.AlbumId 
JOIN InvoiceLine l ON t.TrackId = l.TrackId 
JOIN Invoice i ON l.InvoiceId = i.InvoiceId 
JOIN Customer c ON c.CustomerId = i.CustomerId
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10 ;

-----------------------------

/* Top 10 purchasers */

SELECT 
	a.Name AS 'Artist name'	,
	SUM((l.Quantity)*(l.UnitPrice)) AS 'AmountSpent' ,
	c.CustomerId ,
	c.FirstName ,
	c.LastName ,
    c.FirstName || ' ' || c.LastName AS FullName 
FROM Artist a 
JOIN Album a2 ON a.ArtistId = a2.ArtistId 
JOIN Track t ON a2.AlbumId = t.AlbumId 
JOIN InvoiceLine l ON t.TrackId = l.TrackId 
JOIN Invoice i ON l.InvoiceId = i.InvoiceId 
JOIN Customer c ON c.CustomerId = i.CustomerId
WHERE a.Name = 'Iron Maiden'
GROUP BY 3
ORDER BY 2 DESC
LIMIT 10 ;