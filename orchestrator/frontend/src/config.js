// config.js - API endpoint configuration
// Use relative path - works in dev (proxied) and production

export const API_BASE = '/api';

// In dev: Vite proxy forwards /api -> localhost:8080/api
// In prod: Flask serves from same origin, /api routes to Flask endpoints