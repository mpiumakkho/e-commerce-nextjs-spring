import { useAuthStore } from '@/store/authStore';
import axios from 'axios';

const apiClient = axios.create({
    baseURL: process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8080/api',
    headers: {
        'Content-Type': 'application/json',
    },
});

// add auth token to request headers
apiClient.interceptors.request.use(
    (config) => {
        //zustand hooks only work in components - using store directly
        const token = useAuthStore.getState().token;
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    (error) => {
        return Promise.reject(error);
    }
);

// auto-logout if token is invalid/expired
apiClient.interceptors.response.use(
    (response) => response,
    (error) => {
        if (error.response && error.response.status === 401) {
            // token expired or invalid, force logout
            useAuthStore.getState().logout();
        }
        return Promise.reject(error);
    }
);

export default apiClient;