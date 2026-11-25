# Add Primary Key Constraint 
Alter table products add Primary key (product_id);
Alter table orders add Primary key (order_id);
Alter table customers add Primary key (customer_id);
Alter table orderdetails add Primary key (order_detail_id);
Alter table categories add Primary key (category_id);


### add foreign key as reference key

alter table products add constraint 
foreign key(category_id) references categories(category_id);

alter table orders add constraint
foreign key(customer_id) references customers(customer_id);

alter table orderdetails add constraint
foreign key(order_id) references orders(order_id);

alter table orderdetails add constraint
foreign key(product_id) references products(product_id);