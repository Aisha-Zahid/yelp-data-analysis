
-- schema.sql

-- Business Table
CREATE TABLE IF NOT EXISTS business (
    business_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    latitude REAL,
    longitude REAL,
    stars REAL CHECK (stars >= 0 AND stars <= 5),
    review_count INTEGER CHECK (review_count >= 0),
    is_open INTEGER CHECK (is_open IN (0, 1))
);

-- Category Table
CREATE TABLE IF NOT EXISTS category (
    business_id TEXT,
    category TEXT,
    FOREIGN KEY (business_id) REFERENCES business(business_id)
);

-- Review Table
CREATE TABLE IF NOT EXISTS review (
    review_id TEXT PRIMARY KEY,
    business_id TEXT,
    user_id TEXT,
    stars INTEGER CHECK (stars >= 0 AND stars <= 5),
    date TEXT,
    text TEXT,
    useful INTEGER,
    funny INTEGER,
    cool INTEGER,
    FOREIGN KEY (business_id) REFERENCES business(business_id)
);

-- User Table
CREATE TABLE IF NOT EXISTS user (
    user_id TEXT PRIMARY KEY,
    name TEXT,
    review_count INTEGER CHECK (review_count >= 0),
    yelping_since TEXT,
    useful INTEGER,
    funny INTEGER,
    cool INTEGER,
    fans INTEGER,
    elite TEXT
);

-- Check-in Table
CREATE TABLE IF NOT EXISTS checkin (
    business_id TEXT,
    date TEXT,
    FOREIGN KEY (business_id) REFERENCES business(business_id)
);

-- Tip Table
CREATE TABLE IF NOT EXISTS tip (
    user_id TEXT,
    business_id TEXT,
    text TEXT,
    date TEXT,
    likes INTEGER,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (business_id) REFERENCES business(business_id)
);
