-- Retrieve all stations in the "East" region?

select * from stations
where Location = 'East';

-- List all shows hosted by "Vrajesh Hirjee"?

select * 
from shows as s
join hosts as h on s.hostid = h.hostid 
where HostName = 'Vrajesh Hirjee';

-- Count the number of awards each show has won?

select s.ShowName,count(a.AwardID) as total_award 
from awards as a
join shows as s on a.ShowID = s.ShowID
group by ShowName;

-- Find shows that have partnerships with "Spotify"

select s.ShowName,p.PartnerName from partnerships as p
join shows as s on p.PartnershipID = s.showid
where PartnerName = 'spotify';

-- Retrieve hosts who joined before 2010?

select hostname,joindate 
from hosts
where year(JoinDate)<2010;

-- List the shows and their launch dates in descending order of launch date?

select ShowName,LaunchDate
from shows
order by LaunchDate desc;

-- Find the total count of shows for each host?

select hostname,sum(ShowCount)
from hosts
group by HostName;

-- Show the online presence platforms with their links?

select PlatformName,link from onlinepresence;

-- Retrieve the stations in the "South" region launched after 2010

select * from stations
where Location = 'south'
and year(launchdate)<2010;

-- Rank hosts based on the number of shows they have hosted?

select hostname,ShowCount ,
dense_rank() over(order by showcount desc) as hostrank
from hosts;