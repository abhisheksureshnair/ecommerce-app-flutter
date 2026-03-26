const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5001;

// Middlewares
app.use(cors());
app.use(express.json());

// Mock Products Data (From product.dart)
const products = [
  {
    id: '1',
    name: 'Aether Flux-1',
    description: 'High-performance carbon dynamics with an aesthetic inspired by digital nebulas.',
    price: 2499.00,
    imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?auto=format&fit=crop&q=80&w=1000',
    category: 'Footwear',
    rating: 4.9,
    reviewsCount: 128,
  },
  {
    id: '2',
    name: 'Runner V2',
    description: 'Hand-crafted precision pieces from the world\'s most innovative designers.',
    price: 1240.00,
    imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=1000',
    category: 'Footwear',
    rating: 4.8,
    reviewsCount: 345,
  },
  {
    id: '3',
    name: 'Aurora Silken Gown',
    description: 'A radiant golden gown embodying pure elegance and modern silhouette.',
    price: 3400.00,
    imageUrl: 'https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?auto=format&fit=crop&q=80&w=1000',
    category: 'Apparel',
    rating: 4.7,
    reviewsCount: 89,
  },
  {
    id: '4',
    name: 'Obsidian Clutch',
    description: 'Premium leather handbag with striking dark aesthetics and gold accents.',
    price: 1800.00,
    imageUrl: 'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?auto=format&fit=crop&q=80&w=1000',
    category: 'Accessories',
    rating: 4.9,
    reviewsCount: 256,
  },
  {
    id: '5',
    name: 'Monolith Tote',
    description: 'Classic olive tote blending utility and high fashion.',
    price: 850.00,
    imageUrl: 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?auto=format&fit=crop&q=80&w=1000',
    category: 'Accessories',
    rating: 4.6,
    reviewsCount: 67,
  },
  {
    id: '6',
    name: 'Chrono-01',
    description: 'Exquisite timepiece featuring a minimalist face and premium leather strap.',
    price: 2100.00,
    imageUrl: 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&q=80&w=1000',
    category: 'Accessories',
    rating: 4.9,
    reviewsCount: 42,
  },
];

// Routes
app.get('/api/products', (req, res) => {
  res.json(products);
});

app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;
  // Basic mock auth
  if (email && password) {
    res.json({
      token: 'jwt_mock_token_for_user',
      user: { id: 'user1', name: 'Demo User', email }
    });
  } else {
    res.status(400).json({ message: 'Email and password required' });
  }
});

app.post('/api/auth/register', (req, res) => {
  const { name, email, password } = req.body;
  if (name && email && password) {
    res.status(201).json({
      token: 'jwt_mock_token_new_user',
      user: { id: 'user2', name, email }
    });
  } else {
    res.status(400).json({ message: 'All fields required' });
  }
});

app.get('/', (req, res) => {
  res.send('Luxentia Backend API Running');
});

// Start Server
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
