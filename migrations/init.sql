CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE vendors (
  id SERIAL PRIMARY KEY,
  name TEXT,
  contact_info TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE inventory_items (
  id SERIAL PRIMARY KEY,
  name TEXT,
  vendor_id INT REFERENCES vendors(id),
  stock INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  item_id INT REFERENCES inventory_items(id),
  quantity INT DEFAULT 1,
  status TEXT,
  ecommerce_order_id TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE shipments (
  id SERIAL PRIMARY KEY,
  order_id INT REFERENCES orders(id),
  tracking_number TEXT,
  ship_date DATE,
  status TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE returns (
  id SERIAL PRIMARY KEY,
  order_id INT REFERENCES orders(id),
  reason TEXT,
  status TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE reports (
  id SERIAL PRIMARY KEY,
  name TEXT,
  data JSONB,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE support_tickets (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  subject TEXT,
  status TEXT,
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);