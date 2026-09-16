import axios from 'axios';

// Dynamically resolve API URL for XAMPP / Artisan Serve compatibility
const getApiBaseUrl = () => {
  if (import.meta.env.VITE_API_URL) {
    const rawUrl = import.meta.env.VITE_API_URL.replace(/\/+$/, '');
    return rawUrl.endsWith('/api') ? rawUrl : `${rawUrl}/api`;
  }
  // Check if running directly under XAMPP web server path
  if (typeof window !== 'undefined' && window.location.pathname.includes('/Magang/Inventaris_WIT/')) {
    return '/Magang/Inventaris_WIT/backend/public/api';
  }
  // Default to XAMPP public API endpoint (works with Apache without requiring artisan serve)
  return 'http://localhost/Magang/Inventaris_WIT/backend/public/api';
};

const API_BASE_URL = getApiBaseUrl();

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  },
  withCredentials: false,
});


// Request interceptor to add auth token
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor to handle auth errors
api.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export default api;
