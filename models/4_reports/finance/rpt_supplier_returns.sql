with

order_line_items as (
    select * from {{ ref('fct_customer_order_line_items') }}
    where item_status = 'R'
    and is_valid_customer
    and is_valid_order
),

supplier_parts as (
    select * from {{ ref('fct_supplier_parts') }}
),

returned_part_totals as (
    select 
        date_trunc('month', order_date) as month_start,
        part_supplier_sk,
        count(customer_order_line_item_sk) as parts_returned,
        sum(customer_cost) as total_revenue_lost
    from order_line_items
    group by 1, 2
),

top10_returned_supplier_parts as (
    select 
        *,
        {{ dbt_utils.generate_surrogate_key([
            'month_start',
            'part_supplier_sk'
        ]) }} as part_supplier_month_sk
    from returned_part_totals
    qualify row_number() over(
        partition by month_start 
        order by 
            month_start desc, 
            parts_returned desc, 
            total_revenue_lost desc
    ) <= 10
),

final as (
    select
        top10_returned_supplier_parts.part_supplier_month_sk,
        top10_returned_supplier_parts.month_start,
        top10_returned_supplier_parts.part_supplier_sk,
        supplier_parts.supplier_id,
        supplier_parts.supplier_name,
        supplier_parts.supplier_phone_number,
        supplier_parts.part_id,
        supplier_parts.part_name,
        top10_returned_supplier_parts.parts_returned,
        top10_returned_supplier_parts.total_revenue_lost
    from top10_returned_supplier_parts 
    left join supplier_parts
        on top10_returned_supplier_parts.part_supplier_sk = supplier_parts.part_supplier_sk
)

select * from final
order by 
    month_start desc, 
    total_revenue_lost desc