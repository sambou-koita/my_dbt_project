{% docs mrt_localbike_store_stocks %}

This model makes it possible to monitor stock levels by store and by product, and to identify sourcing priorities, 

Calculated fields:
- **indc_stock** = 
		If stock quantity = 0 then (total_4w_sales + 1) * 100
		Else 100 * total_4w_sales / stock quantity


{% enddocs %}
