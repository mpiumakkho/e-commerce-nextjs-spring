import { create } from 'zustand';
import { createJSONStorage, persist } from 'zustand/middleware';

interface User {
    id: string;
    username: string;
    email: string;
    roles: string[];
}

interface AuthState {
    token: string | null;
    user: User | null;
    setAuth: (token: string, user: User) => void;
    logout: () => void;
}

export const useAuthStore = create<AuthState>()(
    persist(
        (set) => ({
            token: null,
            user: null,
            setAuth: (token, user) => set({ token, user }),
            logout: () => {
                set({ token: null, user: null });
            },
        }),
        {
            name: 'auth-storage', // name of the item in the storage (must be unique)
            storage: createJSONStorage(() => localStorage), // (optional) by default, 'localStorage' is used
        }
    )
); 