use sakila;

select
    f.film_id,
    f.title,
    f.release_year,
    f.language_id,
    f.rental_duration,
    f.rental_rate,
    f.length,
    f.rating,
    f.special_features,
    r.rental_id,
    r.rental_date,
    r.return_date
from
    film f
join
    inventory i on f.film_id = i.film_id
join
    rental r on i.inventory_id = r.inventory_id;
    
    
-- 4. Create a query to get the list of films and a boolean indicating if it was rented last month. This would be our target variable.

select
    film_id,
    title
from
    film;
    
-- boolean indicating if it was rented last month

select
    f.film_id,
    f.title,
    MAX(
        case
            when year(r.return_date) = year(current_date - interval 1 month)
                 and month(r.return_date) = month(current_date - interval 1 month)
            then 1
            else 0
        end
    ) as rented_last_month
from
    film f
left join
    inventory i on f.film_id = i.film_id
left join
    rental r on i.inventory_id = r.inventory_id
group by
    f.film_id, f.title;
    
    
