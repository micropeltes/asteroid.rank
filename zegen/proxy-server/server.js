const express = require('express');
const cors = require('cors');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();

app.use(cors());

app.use('/api', createProxyMiddleware({
  target: 'https://asterank.com',
  changeOrigin: true,
  pathRewrite: {
    '^/api': '/api', // remove /api prefix
  },
}));

app.get('/api/mpc', (req, res) => {
  res.json({ message: 'Hello from server!' });
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});