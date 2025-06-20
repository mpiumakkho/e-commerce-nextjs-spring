"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { useState } from "react";
import api from "../lib/api";
import { useAuthStore } from "../store/authStore";

export default function HomePage() {
  const { token, user, setAuth, logout } = useAuthStore();
  const [apiResponse, setApiResponse] = useState<string>("");

  // test functions for dev
  const simulatePublicData = () => {
    setApiResponse("Development: Public data simulation. Time: " + Date.now());
  };

  const simulateUserData = () => {
    setApiResponse("Development: User data simulation. Time: " + Date.now());
  };

  const simulateAdminData = () => {
    setApiResponse("Development: Admin data simulation. Time: " + Date.now());
  };

  const handleBackendLogin = async () => {
    try {
      setApiResponse("Connecting to backend...");
      const response = await api.post("/auth/mock-login", {
        username: "mock-admin",
        password: "mock-password",
      });
      
      // debug logs
      console.log("Backend response:", response.data);
      console.log("Response structure:", Object.keys(response.data));
      
      const { token, id, username, email, roles } = response.data;
      
      // check data
      console.log("Authentication data extracted:", { token: !!token, id, username, email, roles });
      
      // format user data
      const userData = {
        id: id,
        username: username,
        email: email,
        roles: roles
      };
      
      console.log("Setting authentication state:", { hasToken: !!token, userData });
      
      // save auth
      setAuth(token, userData);
      
      setApiResponse("Authentication successful. Token: " + (token ? token.substring(0, 20) + "..." : "none"));
      console.log("Authentication process completed");
      
      // check state
      setTimeout(() => {
        const currentState = useAuthStore.getState();
        console.log("Current authentication state:", { 
          hasUser: !!currentState.user, 
          hasToken: !!currentState.token 
        });
      }, 100);
      
    } catch (error: any) {
      console.error("Authentication failed:", error);
      const errorMessage = error.response?.data?.message || error.message || "Connection error";
      setApiResponse(`Authentication failed: ${errorMessage}`);
    }
  };

  const handleLocalLogin = () => {
    try {
      setApiResponse("Initializing local session...");
      
      // make token
      const sessionToken = "local-session-" + Date.now() + "-" + Math.random().toString(36).substr(2, 9);
      
      // create user
      const localUser = {
        id: "local-001",
        username: "local-admin",
        email: "local-admin@development.local",
        roles: ["ADMIN"]
      };
      
      console.log("Creating local session:", { sessionToken: sessionToken.substring(0, 20) + "...", localUser });
      
      // save session
      setAuth(sessionToken, localUser);
      setApiResponse("Local session created. Session: " + sessionToken.substring(0, 20) + "...");
      console.log("Local session initialization completed");
      
      // verify
      setTimeout(() => {
        const currentState = useAuthStore.getState();
        console.log("Local session state:", { 
          hasUser: !!currentState.user, 
          hasToken: !!currentState.token 
        });
      }, 100);
      
    } catch (error: any) {
      console.error("Local session creation failed:", error);
      setApiResponse(`Local session failed: ${error.message}`);
    }
  };

  const handleLogout = () => {
    logout();
    setApiResponse("Session terminated");
  };

  const checkAuthenticationState = () => {
    const currentState = useAuthStore.getState();
    console.log("=== AUTHENTICATION STATE CHECK ===");
    console.log("Session token:", currentState.token ? "Present" : "None");
    console.log("User data:", currentState.user);
    setApiResponse(`State Check - Token: ${currentState.token ? 'Active' : 'None'}, User: ${currentState.user ? JSON.stringify(currentState.user) : 'None'}`);
  };

  const fetchPublicData = async () => {
    try {
      setApiResponse("Retrieving public data...");
      const response = await api.get("/test/all");
      setApiResponse(`Public data: ${response.data}`);
    } catch (error: any) {
      console.error("Public data retrieval failed:", error);
      const errorMessage = error.response?.data?.message || error.message || "Network error";
      setApiResponse(`Public data error: ${errorMessage}`);
    }
  };

  const fetchUserData = async () => {
    try {
      setApiResponse("Retrieving user data...");
      const response = await api.get("/test/user");
      setApiResponse(`User data: ${response.data}`);
    } catch (error: any) {
      console.error("User data retrieval failed:", error);
      const errorMessage = error.response?.data?.message || error.message || "Network error";
      setApiResponse(`User data error: ${errorMessage}`);
    }
  };

  const fetchAdminData = async () => {
    try {
      setApiResponse("Retrieving admin data...");
      const response = await api.get("/test/admin");
      setApiResponse(`Admin data: ${response.data}`);
    } catch (error: any) {
      console.error("Admin data retrieval failed:", error);
      const errorMessage = error.response?.data?.message || error.message || "Network error";
      setApiResponse(`Admin data error: ${errorMessage}`);
    }
  };

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24 bg-gray-50">
      <Card className="w-full max-w-2xl">
        <CardHeader>
          <CardTitle className="text-center text-2xl">Development Interface</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {user ? (
              <div>
                <h2 className="text-xl font-semibold text-center">Hello, {user.username}!</h2>
                <p className="text-center text-gray-600">Role: {user.roles.join(', ')}</p>
                <div className="flex justify-center mt-4">
                  <Button onClick={handleLogout} variant="destructive">Logout</Button>
                </div>
              </div>
            ) : (
              <div className="text-center space-y-2">
                <p>No active session</p>
                <div className="flex justify-center gap-2">
                  <Button onClick={handleLocalLogin} className="bg-green-600 hover:bg-green-700">
                    Local Session
                  </Button>
                  <Button onClick={handleBackendLogin} className="bg-blue-600 hover:bg-blue-700">
                    Backend Session
                  </Button>
                </div>
              </div>
            )}
          </div>

          <hr className="my-6" />

          <div className="space-y-4">
            <h3 className="text-lg font-semibold text-center">Data Access</h3>
            <div className="flex justify-center gap-4 flex-wrap">
              <Button onClick={user?.username === 'local-admin' ? simulatePublicData : fetchPublicData}>
                Public Data
              </Button>
              <Button 
                onClick={user?.username === 'local-admin' ? simulateUserData : fetchUserData} 
                disabled={!user}
              >
                User Data {!user && '(Authentication Required)'}
              </Button>
              <Button 
                onClick={user?.username === 'local-admin' ? simulateAdminData : fetchAdminData} 
                disabled={!user}
                variant="secondary"
              >
                Admin Data {!user && '(Authentication Required)'}
              </Button>
            </div>
            <div className="flex justify-center mt-2">
              <Button onClick={checkAuthenticationState} variant="outline" size="sm">
                Check State
              </Button>
            </div>
          </div>
          
          {apiResponse && (
            <div className="mt-6 p-4 bg-gray-100 rounded-md">
              <h4 className="font-semibold">Response:</h4>
              <pre className="text-sm whitespace-pre-wrap break-all"><code>{apiResponse}</code></pre>
            </div>
          )}
        </CardContent>
      </Card>
    </main>
  );
} 