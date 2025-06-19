'use client';

import axios from 'axios';
import { useEffect, useState } from 'react';

export default function Home() {
  const [message, setMessage] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        const response = await axios.get('http://localhost:8080/api/public/hello');
        setMessage(response.data);
        setError('');
      } catch (err) {
        setError('ไม่สามารถเชื่อมต่อกับ backend ได้');
        console.error('Error fetching data:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex items-center justify-center p-4">
      <div className="max-w-md w-full bg-white rounded-lg shadow-lg p-8">
        <h1 className="text-3xl font-bold text-center text-gray-800 mb-8">
          E-Commerce
        </h1>
        
        <div className="space-y-4">
          <div className="text-center">
            <h2 className="text-xl font-semibold text-gray-700 mb-2">
              ข้อมูลจาก Backend:
            </h2>
            
            {loading && (
              <div className="flex items-center justify-center">
                <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                <span className="ml-2 text-gray-600">กำลังโหลด...</span>
              </div>
            )}
            
            {error && (
              <div className="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
                {error}
              </div>
            )}
            
            {message && !loading && !error && (
              <div className="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded">
                {message}
              </div>
            )}
          </div>
          
          <div className="text-center text-sm text-gray-500 mt-6">
            <p>Frontend: Next.js + TypeScript</p>
            <p>Backend: Java + Spring Boot</p>
          </div>
        </div>
      </div>
    </div>
  );
}
