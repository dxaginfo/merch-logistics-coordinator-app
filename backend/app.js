import express from 'express';
import bodyParser from 'body-parser';
const app = express();
app.use(bodyParser.json());
app.get('/health', (req, res) => res.send('Merch Logistics Coordinator API OK'));
// TODO: Add endpoints for: users, vendors, inventory, orders, shipments, returns, reports, support
const port = process.env.PORT || 5000;
app.listen(port, () => console.log('Server running on ' + port));