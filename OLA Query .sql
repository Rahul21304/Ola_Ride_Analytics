Use ola;

select * from bookings;

#1.Retrieve all successful bookings:
select * 
from bookings
where Booking_status = "Success";


#2. Find the average ride distance for each vehicle type:
select Vehicle_type , avg(Ride_Distance) as Averege_Ride_Distance
from bookings
group by Vehicle_type;


#3. Get the total number of cancelled rides by customers:
select count(Canceled_Rides_by_Customer)
from bookings;
 
 
#4. List the top 5 customers who booked the highest number of rides:
select Customer_ID, count(Booking_ID)
from bookings
group by Customer_ID
order by Count(Booking_ID) DESC
limit 5;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select Count(Booking_ID)
from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select Vehicle_type, Ifnull(min(Driver_Ratings),0), max(Driver_Ratings), Avg(Driver_Ratings)
from bookings
Where Vehicle_Type = "Prime Sedan";
 
 
#7. Retrieve all rides where payment was made using UPI:
select *
from bookings
where Payment_Method = "UPI";


#8. Find the average customer rating per vehicle type:
select  Vehicle_Type, Round(avg(Customer_Rating),2) as Average_Ratings
from bookings
group by Vehicle_Type;


#9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) as Total_Booking_Value
from bookings
where Booking_status = "Success";


#10. List all incomplete rides along with the reason
select Booking_ID , Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = "Yes";


#11. Calculate the average time taken between pickup and drop by vehicle type
select Vehicle_Type , Avg(V_TAT) as Time_Taken
from bookings
group by Vehicle_Type;


#12. Find the top 3 drop locations with the highest average booking value.
select Drop_Location, Avg(Booking_Value) as Average_Booking_Value 
from bookings
group by Drop_Location 
order by Avg(Booking_Value) DESC
limit 3;


#13. Identify customers who cancelled more than 2 rides 
select Customer_ID , Count(Booking_ID)
from bookings
where booking_Status = "Canceled by Customer"
group by Customer_ID
having Count(Booking_ID)>2;

