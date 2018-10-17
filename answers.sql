-- Get all invoices where the UnitPrice on the InvoiceLine is greater than $0.99.
select * 
from invoice i
	join invoiceline il
    on i.invoiceid = il.invoiceid
    where il.unitprice > 0.99;

--Get the InvoiceDate, customer FirstName and LastName, and Total from all invoices.
select i.invoicedate,c.firstname,c.lastname,i.total 
from invoice i
	join customer c
    on i.customerid = c.customerid;

--Get the customer FirstName and LastName and the support rep's FirstName and LastName from all customers.
select c.firstname,c.lastname,e.firstname||' '||e.lastname
from customer c
	join employee e
    on c.supportrepid = e.employeeid;

--Get the album Title and the artist Name from all albums.
select al.title,ar.name
from artist ar
	join album al
    on al.artistid = ar.artistid;

--Get all PlaylistTrack TrackIds where the playlist Name is Music.
select pt.trackid
from playlisttrack pt
	join playlist pl
    on pt.playlistid = pl.playlistid
    where pl.name = 'Music';

--Get all Track Names for PlaylistId 5.
select tr.name
from playlisttrack pt
    join track tr
    on pt.trackid = tr.trackid
    where pt.playlistid = 5

--Get all Track Names and the playlist Name that they're on ( 2 joins ).
select tr.name,pl.name
from playlisttrack pt
    join track tr
    on pt.trackid = tr.trackid
    join playlist pl
    on pl.playlistid = pt.playlistid;

--Get all Track Names and Album Titles that are the genre "Alternative" ( 2 joins ).
select tr.name,al.title
from genre ge
    join track tr
    on ge.genreid = tr.genreid
    join album al
    on tr.albumid = al.albumid;
  