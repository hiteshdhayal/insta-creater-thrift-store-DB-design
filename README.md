# Instagram Thrift & Handmade Store – Database Design (ER Diagram)

## blog - https://x.com/hiteshdhayall/status/2041214809472188441?s=20

This project contains the **Entity Relationship (ER) diagram** for a small Instagram-based store that sells **thrifted fashion items and handmade products**.

Initially the store receives orders through **Instagram DMs and WhatsApp**, but as the business grows it needs a structured way to manage:

* products
* stock availability
* customer information
* orders
* payments
* shipping

This project focuses on designing a **normalized database structure** that can support these operations efficiently.

---

# Business Problem

The store sells two types of products:

### Thrift Items

* Usually **one-of-a-kind**
* Only **one piece available**
* Condition and brand are important attributes

### Handmade Items

* Can be produced in **multiple units**
* May have **size or color variations**
* Can be **made-to-order**

The database must handle both types of products properly.

---

# Database Design Goals

The ER diagram was designed to answer the following questions:

* What products are being sold?
* Are they thrift or handmade?
* How many pieces are available?
* Which customer placed which order?
* What items were part of an order?
* Has the order been paid for?
* Has the order been shipped?

---

# Entities in the System

## 1. Customer

Stores customer information.

Attributes:

* `customer_id (PK)`
* full_name
* phone / email
* instagram_handle

Relationship:

* One customer can place **multiple orders**

---

## 2. Order

Represents a purchase made by a customer.

Attributes:

* `order_id (PK)`
* `customer_id (FK)`
* order_date
* order_status
* order_source

Relationship:

* One order belongs to **one customer**
* One order can contain **multiple order items**

---

## 3. Order Item

Stores products included in an order.

Attributes:

* `order_item_id (PK)`
* `order_id (FK)`
* `variant_id (FK)`
* quantity
* unit_price

Purpose:
This table resolves the **many-to-many relationship** between orders and products.

---

## 4. Product

Represents items sold in the store.

Attributes:

* `product_id (PK)`
* name
* category
* price
* product_type (thrift / handmade)
* is_active

Relationship:

* One product can have **multiple variants**

---

## 5. Product Variant

Stores variations of a product.

Attributes:

* `variant_id (PK)`
* `product_id (FK)`
* size
* color
* stock_quantity

Example:
A hoodie may have multiple variants such as:

* Hoodie – Small – Blue
* Hoodie – Medium – Blue
* Hoodie – Large – Black

---

## 6. Thrift Detail

Stores additional information specific to thrift items.

Attributes:

* `thrift_detail_id (PK)`
* `product_id (FK)`
* condition
* brand
* is_one_of_a_kind

---

## 7. Handmade Detail

Stores information specific to handmade products.

Attributes:

* `handmade_detail_id (PK)`
* `product_id (FK)`
* materials_used
* made_to_order

---

## 8. Payment

Stores payment information for orders.

Attributes:

* `payment_id (PK)`
* `order_id (FK)`
* method
* status
* amount_paid
* payment_date

---

## 9. Shipment

Stores shipping and delivery details.

Attributes:

* `shipment_id (PK)`
* `order_id (FK)`
* courier
* tracking
* shipping_status
* dispatched_at

---

# Order Flow in the System

The business flow works as follows:

1. A **customer** places an order.
2. The **order** is created in the Orders table.
3. The order contains **one or more order items**.
4. Each order item references a **product variant**.
5. Each variant belongs to a **product**.
6. The order triggers a **payment record**.
7. Once processed, the order generates a **shipment record**.

Flow diagram:

Customer → Order → Order Items → Product Variant → Product
↘ Payment
↘ Shipment

---

# Key Database Concepts Used

### Primary Key (PK)

A unique identifier for each record in a table.

Example:
`customer_id`

### Foreign Key (FK)

A field that references a primary key in another table.

Example:
`Orders.customer_id → Customer.customer_id`

---

# Technologies Used

* **ER Modeling**
* **Database Design Concepts**
* **Draw.io / SVG Diagram**
* **HTML + SVG visualization**

---

# Files in This Repository

* `diagram.png` – exported ER diagram image
* `diagram.svg` – scalable diagram version
* `diagram.html` – visual HTML version
* `README.md` – project documentation

---

# Learning Outcomes

This project demonstrates understanding of:

* ER diagram design
* database normalization
* primary and foreign keys
* one-to-many relationships
* many-to-many relationships
* modeling real business workflows

---

# Author

Hitesh Dhayal
Full Stack Developer | Learning Databases & System Design
