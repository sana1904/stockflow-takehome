# Part 3 – Low Stock Alerts API

## Endpoint
GET /api/companies/{company_id}/alerts/low-stock

## Logic Overview

- Fetch all products for a company across warehouses
- Consider only products with recent sales activity (last 30 days)
- Compare current inventory with product-specific low-stock threshold
- Calculate estimated days until stockout
- Include supplier details for reordering

## Assumptions

- Recent sales means last 30 days
- One primary supplier per product
- Average daily sales is calculated from recent sales
- Alerts are warehouse-specific

## Edge Cases Handled

- Products with no recent sales are ignored
- Division by zero avoided
- Missing supplier data handled gracefully
