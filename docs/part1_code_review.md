# Part 1 – Code Review & Debugging

## Issues Identified

1. SKU uniqueness is not enforced  
   - This can lead to duplicate products across the system.

2. Product is directly linked to a warehouse  
   - Products should exist independently and be stored in multiple warehouses.

3. Multiple database commits  
   - If inventory creation fails, the product is still saved, causing inconsistent data.

4. No input validation  
   - Missing or invalid fields can crash the API.

5. Price precision issues  
   - Using floating point values for price can cause rounding errors.

## Impact in Production

- Data inconsistency
- Duplicate SKUs
- Incorrect inventory counts
- Financial calculation errors

## Fix Summary

- Enforce unique SKU constraint
- Use inventory as a join table between products and warehouses
- Wrap operations in a single database transaction
- Validate input data
- Use decimal types for price
