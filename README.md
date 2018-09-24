
# Shopify API Challenge Winter 2019

This is my submission for the Shopify API challenge. The API is built with Ruby on Rails and PostgreSQL.

[Live Heroku deployment](https://fierce-ravine-88093.herokuapp.com/) with sample data.

# Local Installation

 1. Install Ruby and PostgreSQL
 2. Run the following commands:
    ```
    gem install rails
    git clone https://github.com/saeedosman/shopify-api-challenge 
    cd shopify-api-challenge 
    bundle install
    ```
3. Modify `/config/database.yml` and add your PostgreSQL username and password
4. Run the following commands:
    ```
    rake db:create
    rake db:migrate
    rails server
    ```

4. Visit `http://localhost:3000` in your browser


# API Documentation

The API supports full CRUD functionality. Below are a few sample API calls.

### 1. Get all shops

```
url: /api/shops
method: GET
parameters body: N/A
```
#### Sample response
```
[
    {
        "id": 1,
        "name": "Amazon",
        "created_at": "2018-09-24T04:47:35.419Z",
        "updated_at": "2018-09-24T04:47:35.419Z"
    },
    {
        "id": 2,
        "name": "Walmart",
        "created_at": "2018-09-24T04:47:45.879Z",
        "updated_at": "2018-09-24T04:47:45.879Z"
    },
]
```

### 2. Create new product

```
url: /api/shops/:shop_id/products/
method: POST
parameters body: name, price
```
#### Sample response
```
{
    "id": 1,
    "name": "Laptop",
    "price": "1000.0",
    "shop_id": 1,
    "created_at": "2018-09-24T06:18:00.898Z",
    "updated_at": "2018-09-24T06:18:00.898Z"
}
```

### 3. Add a line item to an order by id

```
url: /api/shops/:shop_id/orders/:order_id/line_items
method: POST
parameters body: quantity, product_id
```
#### Sample response
```
{
    "id": 2,
    "quantity": 3,
    "price": "48.0",
    "order_id": 1,
    "product_id": 2,
    "created_at": "2018-09-24T06:31:55.912Z",
    "updated_at": "2018-09-24T06:31:55.931Z"
}
```


### 4. Get an order from a shop by id

```
url: /api/shops/:shop_id/orders/:order_id
method: GET
parameters body: N/A
```
#### Sample response
```
{
    "id": "1",
    "order": [
        {
            "id": 1,
            "quantity": 10,
            "price": "10000.0",
            "order_id": 1,
            "product_id": 1,
            "created_at": "2018-09-24T06:31:27.014Z",
            "updated_at": "2018-09-24T06:31:27.051Z"
        },
        {
            "id": 2,
            "quantity": 3,
            "price": "48.0",
            "order_id": 1,
            "product_id": 2,
            "created_at": "2018-09-24T06:31:55.912Z",
            "updated_at": "2018-09-24T06:31:55.931Z"
        }
    ],
    "bill": "10048.0"
}
```

The complete list of endpoints:

### 1. Create a new shop
```
url: /api/shops/
method: POST
parameter body: name
```

### 2. List all shops
```
url: /api/shops/
method: GET
parameter body: N/A
```

### 3. Get a shop by id
```
url: /api/shops/:shop_id
method: GET
parameter body: N/A
```

### 4. Update a shop
```
url: /api/shops/:shop_id
method: PUT
parameter body: name
```

### 5. Delete a shop
```
url: /api/shops/:shop_id
method: DELETE
parameter body: N/A
```


### 6. Create a new product
```
url: /api/shops/:shop_id/products
method: POST
parameter body: name, price
```

### 7. Get all products in a shop
```
url: /api/shops/:shop_id/products
method: GET
parameter body: N/A
```

### 8. Get a product from a shop by id
```
url: /api/shops/:shop_id/products/:products_id
method: GET
parameter body: N/A
```

### 9. Update a product
```
url: /api/shops/:shop_id/products/:products_id
method: PUT
parameter body: name, price
```

### 10. Delete a product
```
url: /api/shops/:shop_id/products/:products_id
method: DELETE
parameter body: N/A
```

### 11. Create a new order
```
url: /api/shops/:shop_id/orders
method: POST
parameter body: N/A
```

### 12. Get all orders from a shop
```
url: /api/shops/:shop_id/orders
method: GET
parameter body: N/A
```

### 13. Get an order from a shop by id
```
url: /api/shops/:shop_id/orders/:order_id
method: GET
parameter body: N/A
```

### 14. Update an order
```
url: /api/shops/:shop_id/orders/:order_id
method: PUT
parameter body: N/A
```

### 15. Delete an order
```
url: /api/shops/:shop_id/orders/:order_id
method: DELETE
parameters body: N/A
```

### 16. Add a new line item to an order
```
url: /api/shops/:shop_id/orders/:order_id/line_items
method: POST
parameter body: quantity, product_id
```

### 17. Get all line items in an order
```
url: /api/shops/:shop_id/orders/:order_id/line_items
method: GET
parameter body: N/A
```

### 18. Get a line item in an order by id
```
url: /api/shops/:shop_id/orders/:order_id/line_items/:line_item_id
method: GET
parameter body: N/A
```

### 19. Update a line item
```
url: /api/shops/:shop_id/orders/:order_id/line_items/:line_item_id
method: PUT
parameter body: quantity, product_id
```

### 20. Delete a line item
```
url: /api/shops/:shop_id/orders/:order_id/line_items/:line_item_id
method: DELETE
parameters body: N/A
```






