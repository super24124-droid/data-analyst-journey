1)SELECT Name, UnitPrice 
  FROM Track 
  ORDER BY UnitPrice 
  DESC LIMIT 5; Пять самых дорогих треков в магазине

2)SELECT Country, COUNT(CustomerId) AS NumberOfCustomers 
  FROM Customer 
  GROUP BY Country 
  ORDER BY NumberOfCustomers DESC; Количество клиентов в каждой стране

3)SELECT InvoiceId, SUM(Quantity * UnitPrice) AS TotalSpent 
  FROM InvoiceLine 
  GROUP BY InvoiceId 
  ORDER BY TotalSpent DESC; Общая выручка по каждому счету-фактуре

4)SELECT i.InvoiceDate, t.Name AS TrackName, g.Name AS Genre, il.UnitPrice, il.Quantity 
  FROM Invoice i 
  JOIN InvoiceLine il 
  ON i.InvoiceId = il.InvoiceId 
  JOIN Track t 
  ON il.TrackId = t.TrackId 
  JOIN Genre g 
  ON t.GenreId = g.GenreId 
  WHERE i.CustomerId = 6; Вся информация по конкретному пользователю (6)

5)SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent 
  FROM Customer c 
  JOIN Invoice i 
  ON c.CustomerId = i.CustomerId 
  GROUP BY c.CustomerId, c.FirstName, c.LastName 
  ORDER BY TotalSpent DESC 
  LIMIT 5; Покупатели (5), потратившие больше всего денег

6)SELECT g.Name AS Genre, COUNT(il.Quantity) AS TracksSold 
  FROM Genre g 
  JOIN Track t 
  ON g.GenreId = t.GenreId 
  JOIN InvoiceLine il 
  ON t.TrackId = il.TrackId 
  GROUP BY g.Name 
  ORDER BY TracksSold DESC 
  LIMIT 1; Самый продаваемый жанр музыки

7)SELECT BillingCountry, SUM(Total) AS CountryRevenue 
  FROM Invoice 
  GROUP BY BillingCountry 
  ORDER BY CountryRevenue DESC; Общая выручка по каждой стране

8)SELECT a.Title AS AlbumName, ar.Name AS ArtistName, COUNT(t.TrackId) AS NumberOfTracks 
  FROM Album a 
  JOIN Artist ar 
  ON a.ArtistId = ar.ArtistId 
  JOIN Track t 
  ON a.AlbumId = t.AlbumId 
  GROUP BY a.AlbumId, a.Title, ar.Name 
  HAVING COUNT(t.TrackId) > 15 
  ORDER BY NumberOfTracks DESC; Альбомы в которых больше 15 треков

9)SELECT AVG(Total) AS AverageInvoice, MIN(Total) AS SmallestInvoice, MAX(Total) AS LargestInvoice 
  FROM Invoice; Средний, минимальный и максимальный чек

10)SELECT CustomerId, FirstName, LastName, Email 
  FROM Customer 
  WHERE FirstName LIKE '%an%' OR LastName LIKE '%an%'; Все клиенты, в имени или фамилии которых есть подстрока 'an'
