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

--Get all tracks on the playlist(s) called Music and show their name, genre name, album name, and artist name.
select tr.name,ge.name,al.title,ar.name
from genre ge
    join track tr
    on ge.genreid = tr.genreid
    join album al
    on tr.albumid = al.albumid
    join artist ar
    on al.artistid = ar.artistid
    join playlisttrack pt
    on pt.trackid = tr.trackid
    join playlist pl 
    on pl.playlistid = pt.playlistid
    where pl.name = 'Music';
    
    --NESTED QUERIES--

--Find all customers with fax numbers and set those numbers to null.
select * 
	from invoice
    where invoiceid in (
    	select invoiceid 
      	from invoiceline
      	where unitprice >0.99
    )

--Get all Playlist Tracks where the playlist name is Music.
select * 
	from playlisttrack
    where playlistid in
    (select playlistid
     from playlist
     where name = 'Music');

--Get all Track names for PlaylistId 5.
select name 
	from track
    where trackid in
    (select trackid
     from playlisttrack
     where playlistid = 5);

--Get all tracks where the Genre is Comedy.
select * 
	from track
    where genreid in
    (select genreid
     from genre
     where name = 'Comedy');

--Get all tracks where the Album is Fireball.
select * 
	from track
    where albumid in
    (select albumid
     from album
     where artistid in(
     	select artistid
       	from artist
       	where name = 'Queen'
     )
    );

--UPDATING ROWS--

--Find all customers with fax numbers and set those numbers to null.
update customer
set fax = null
where fax is not null;

--Find all customers with no company (null) and set their company to "Self".
update customer
set company = 'Self'
where company is null;

--Find the customer Julia Barnett and change her last name to Thompson.
update customer
set lastname = 'Thompson'
where firstname = 'Julia'
and lastname = 'Barnett';

--Find the customer with this email luisrojas@yahoo.cl and change his support rep to 4.
update customer
set supportrepid = 4
where email = 'luisrojas@yahoo.cl';

--Find all tracks that are the genre Metal and have no composer. Set the composer to "The darkness around us".
select count(*),genre.name
	from track
    join genre
    on track.genreid = genre.genreid
    group by genre.name

--Find a count of how many tracks are the "Pop" genre and how many tracks are the "Rock" genre.
select count(*),genre.name
	from track
    join genre
    on track.genreid = genre.genreid
    where
     genre.name = 'Pop' or
     genre.name = 'Rock'
    group by genre.name

--Find a list of all artists and how many albums they have.
select artist.name, count(album.title)
	from artist
    join album
    on album.artistid = artist.artistid
    group by artist.name

--From the Track table find a unique list of all Composers.
select distinct composer
from track

--From the Invoice table find a unique list of all BillingPostalCodes.
select distinct billingpostalcode
from invoice

--From the Customer table find a unique list of all Companys.
select distinct company
from customer

--deleting column
    DELETE
    from col_name
    where condition = true;