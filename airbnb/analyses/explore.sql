SELECT 
    * 
FROM 
    {{ ref('dim_listings_clean') }} 
WHERE 
    {{ no_empty_strings(ref('dim_listings_clean')) }}