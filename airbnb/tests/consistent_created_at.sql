select
    r.listing_id
from {{ ref('fct_reviews') }} r
join {{ ref('dim_listings_clean') }} lc 
    on r.listing_id = lc.listing_id
where r.review_date<lc.created_at
limit 10