#!/bin/bash

echo "Creating TrainCraft AI project files..."

# Create package.json
cat > package.json << 'EOF'
{
  "name": "traincraft-ai",
  "private": true,
  "version": "0.1.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "lint": "eslint . --ext ts,tsx --report-unused-disable-directives --max-warnings 0",
    "preview": "vite preview"
  },
  "dependencies": {
    "@aws-amplify/ui-react": "^5.3.1",
    "@hookform/resolvers": "^3.3.2",
    "aws-amplify": "^5.3.11",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.0.0",
    "lucide-react": "^0.288.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-hook-form": "^7.47.0",
    "tailwind-merge": "^1.14.0",
    "tailwindcss-animate": "^1.0.7",
    "wouter": "^2.11.0",
    "zod": "^3.22.4"
  },
  "devDependencies": {
    "@types/node": "^20.8.7",
    "@types/react": "^18.2.15",
    "@types/react-dom": "^18.2.7",
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "@typescript-eslint/parser": "^6.0.0",
    "@vitejs/plugin-react": "^4.0.3",
    "autoprefixer": "^10.4.16",
    "eslint": "^8.45.0",
    "eslint-plugin-react-hooks": "^4.6.0",
    "eslint-plugin-react-refresh": "^0.4.3",
    "postcss": "^8.4.31",
    "tailwindcss": "^3.3.3",
    "typescript": "^5.0.2",
    "vite": "^4.4.5"
  }
}
EOF

# Create vite.config.ts
cat > vite.config.ts << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
EOF

# Create tsconfig.json
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    },

    /* Bundler mode */
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",

    /* Linting */
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
EOF

# Create tsconfig.node.json
cat > tsconfig.node.json << 'EOF'
{
  "compilerOptions": {
    "composite": true,
    "skipLibCheck": true,
    "module": "ESNext",
    "moduleResolution": "bundler",
    "allowSyntheticDefaultImports": true
  },
  "include": ["vite.config.ts"]
}
EOF

# Create tailwind.config.js
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
  ],
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: 0 },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: 0 },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
}
EOF

# Create postcss.config.js
cat > postcss.config.js << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Create index.html in public folder
cat > public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TrainCraft AI</title>
    <meta name="description" content="AI-powered AWS training content creation platform" />
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/index.tsx"></script>
  </body>
</html>
EOF

# Create src files
cat > src/index.tsx << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App.tsx';
import './index.css';

// Import Amplify for AWS integration
import { Amplify } from 'aws-amplify';
import config from './aws-exports';

// Configure Amplify with exported AWS configuration
// This will be generated after running 'amplify push'
try {
  Amplify.configure(config);
} catch (error) {
  console.warn('AWS Amplify configuration not found. Running in development mode.');
}

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
EOF

cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 222.2 84% 4.9%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96.1%;
    --secondary-foreground: 222.2 47.4% 11.2%;
    --muted: 210 40% 96.1%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --accent: 210 40% 96.1%;
    --accent-foreground: 222.2 47.4% 11.2%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 221.2 83.2% 53.3%;
    --radius: 0.5rem;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    --card: 222.2 84% 4.9%;
    --card-foreground: 210 40% 98%;
    --popover: 222.2 84% 4.9%;
    --popover-foreground: 210 40% 98%;
    --primary: 217.2 91.2% 59.8%;
    --primary-foreground: 222.2 47.4% 11.2%;
    --secondary: 217.2 32.6% 17.5%;
    --secondary-foreground: 210 40% 98%;
    --muted: 217.2 32.6% 17.5%;
    --muted-foreground: 215 20.2% 65.1%;
    --accent: 217.2 32.6% 17.5%;
    --accent-foreground: 210 40% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 210 40% 98%;
    --border: 217.2 32.6% 17.5%;
    --input: 217.2 32.6% 17.5%;
    --ring: 224.3 76.3% 48%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
    font-feature-settings: "rlig" 1, "calt" 1;
  }
}
EOF

cat > src/App.tsx << 'EOF'
import React from 'react';
import { Authenticator } from '@aws-amplify/ui-react';
import '@aws-amplify/ui-react/styles.css';
import { ThemeProvider } from './context/ThemeContext';
import { AppLayout } from './layout/AppLayout';

// Main application component
function App() {
  return (
    <ThemeProvider defaultTheme="system" storageKey="traincraft-theme">
      <Authenticator>
        {({ signOut, user }) => (
          <AppLayout 
            user={user} 
            signOut={signOut} 
          />
        )}
      </Authenticator>
    </ThemeProvider>
  );
}

export default App;
EOF

# Create context directory files
mkdir -p src/context
cat > src/context/ThemeContext.tsx << 'EOF'
import React, { createContext, useEffect, useState } from "react";

type Theme = "dark" | "light" | "system";

type ThemeProviderProps = {
  children: React.ReactNode;
  defaultTheme?: Theme;
  storageKey?: string;
};

type ThemeProviderState = {
  theme: Theme;
  setTheme: (theme: Theme) => void;
};

const initialState: ThemeProviderState = {
  theme: "system",
  setTheme: () => null,
};

export const ThemeContext = createContext<ThemeProviderState>(initialState);

export function ThemeProvider({
  children,
  defaultTheme = "system",
  storageKey = "ui-theme",
  ...props
}: ThemeProviderProps) {
  const [theme, setTheme] = useState<Theme>(
    () => (localStorage.getItem(storageKey) as Theme) || defaultTheme
  );

  useEffect(() => {
    const root = window.document.documentElement;
    root.classList.remove("light", "dark");

    if (theme === "system") {
      const systemTheme = window.matchMedia("(prefers-color-scheme: dark)")
        .matches
        ? "dark"
        : "light";
      root.classList.add(systemTheme);
    } else {
      root.classList.add(theme);
    }
  }, [theme]);

  const value = {
    theme,
    setTheme: (theme: Theme) => {
      localStorage.setItem(storageKey, theme);
      setTheme(theme);
    },
  };

  return (
    <ThemeContext.Provider {...props} value={value}>
      {children}
    </ThemeContext.Provider>
  );
}
EOF

# Create hooks directory files
mkdir -p src/hooks
cat > src/hooks/useTheme.ts << 'EOF'
import { useContext } from "react";
import { ThemeContext } from "../context/ThemeContext";

export const useTheme = () => {
  const context = useContext(ThemeContext);

  if (context === undefined) {
    throw new Error("useTheme must be used within a ThemeProvider");
  }

  return context;
};
EOF

# Create lib directory files
mkdir -p src/lib
cat > src/lib/utils.ts << 'EOF'
import { type ClassValue, clsx } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
EOF

# Create layout directory files
mkdir -p src/layout
cat > src/layout/AppLayout.tsx << 'EOF'
import React, { useState } from 'react';
import { SideNavigation } from './SideNavigation';
import { ProjectHeader } from '../components/core/ProjectHeader';
import { AIAssistant } from '../components/core/AIAssistant';
import { useTheme } from '../hooks/useTheme';
import { Route, Switch } from 'wouter';
import { Dashboard } from '../components/pages/Dashboard';
import { ProjectDetail } from '../components/pages/ProjectDetail';

// Type for user object from Amplify Auth
interface User {
  username: string;
  attributes: {
    email: string;
    name?: string;
  };
}

// Props for AppLayout
interface AppLayoutProps {
  user: User;
  signOut: () => void;
}

export const AppLayout = ({ user, signOut }: AppLayoutProps) => {
  const { theme, setTheme } = useTheme();
  const [aiAssistantOpen, setAiAssistantOpen] = useState(false);

  const toggleTheme = () => {
    setTheme(theme === 'dark' ? 'light' : 'dark');
  };

  const toggleAIAssistant = () => {
    setAiAssistantOpen(!aiAssistantOpen);
  };

  return (
    <div className="flex h-screen bg-background">
      {/* Side Navigation */}
      <SideNavigation 
        user={user} 
        signOut={signOut} 
        toggleTheme={toggleTheme}
        theme={theme}
        toggleAIAssistant={toggleAIAssistant}
      />
      
      {/* Main Content */}
      <div className="flex flex-col flex-1 overflow-hidden">
        {/* Project Header */}
        <ProjectHeader user={user} />
        
        {/* Main Workspace */}
        <main className="flex-1 overflow-auto p-6">
          <Switch>
            <Route path="/" component={Dashboard} />
            <Route path="/projects/:id">
              {params => <ProjectDetail projectId={params.id} />}
            </Route>
          </Switch>
        </main>
      </div>
      
      {/* AI Assistant Sidebar */}
      {aiAssistantOpen && (
        <AIAssistant 
          onClose={() => setAiAssistantOpen(false)} 
        />
      )}
    </div>
  );
};
EOF

cat > src/layout/SideNavigation.tsx << 'EOF'
import React from 'react';
import { Link, useLocation } from 'wouter';
import { Home, FileText, Settings, LogOut, Sun, Moon, MessageCircle } from 'lucide-react';

interface SideNavigationProps {
  user: {
    username: string;
    attributes: {
      email: string;
      name?: string;
    };
  };
  signOut: () => void;
  toggleTheme: () => void;
  theme: string;
  toggleAIAssistant: () => void;
}

export const SideNavigation = ({ 
  user, 
  signOut, 
  toggleTheme, 
  theme,
  toggleAIAssistant 
}: SideNavigationProps) => {
  const [location] = useLocation();
  
  return (
    <div className="w-64 h-full bg-card border-r border-border flex flex-col">
      {/* App Logo */}
      <div className="h-14 flex items-center px-4 border-b border-border">
        <h1 className="text-lg font-semibold">TrainCraft AI</h1>
      </div>
      
      {/* Navigation Links */}
      <nav className="flex-1 py-4 overflow-y-auto">
        <ul className="space-y-1 px-2">
          <li>
            <Link href="/">
              <a className={`flex items-center px-3 py-2 rounded-md text-sm ${
                location === '/' 
                  ? 'bg-primary text-primary-foreground' 
                  : 'hover:bg-secondary hover:text-secondary-foreground'
              }`}>
                <Home className="h-4 w-4 mr-2" />
                Dashboard
              </a>
            </Link>
          </li>
          <li>
            <button 
              onClick={toggleAIAssistant}
              className="flex w-full items-center px-3 py-2 rounded-md text-sm hover:bg-secondary hover:text-secondary-foreground"
            >
              <MessageCircle className="h-4 w-4 mr-2" />
              AI Assistant
            </button>
          </li>
          <li className="pt-4 mt-4 border-t border-border">
            <span className="px-3 text-xs font-medium text-muted-foreground">
              Recent Projects
            </span>
          </li>
          <li>
            <Link href="/projects/example-project">
              <a className="flex items-center px-3 py-2 rounded-md text-sm hover:bg-secondary hover:text-secondary-foreground">
                <FileText className="h-4 w-4 mr-2" />
                Example Project
              </a>
            </Link>
          </li>
        </ul>
      </nav>
      
      {/* User Controls */}
      <div className="p-4 border-t border-border">
        <div className="mb-4">
          <p className="text-sm font-medium">{user.attributes.name || user.username}</p>
          <p className="text-xs text-muted-foreground">{user.attributes.email}</p>
        </div>
        <div className="flex space-x-2">
          <button 
            onClick={toggleTheme}
            className="p-2 rounded-md hover:bg-secondary"
            aria-label="Toggle theme"
          >
            {theme === 'dark' ? <Sun className="h-4 w-4" /> : <Moon className="h-4 w-4" />}
          </button>
          <button 
            onClick={() => {/* Open settings */}}
            className="p-2 rounded-md hover:bg-secondary"
            aria-label="Settings"
          >
            <Settings className="h-4 w-4" />
          </button>
          <button 
            onClick={signOut}
            className="p-2 rounded-md hover:bg-secondary"
            aria-label="Sign out"
          >
            <LogOut className="h-4 w-4" />
          </button>
        </div>
      </div>
    </div>
  );
};
EOF

# Create components/core directory files
mkdir -p src/components/core
cat > src/components/core/ProjectHeader.tsx << 'EOF'
import React from 'react';
import { useLocation } from 'wouter';
import { Button } from '../ui/button';
import { PlusCircle } from 'lucide-react';

interface ProjectHeaderProps {
  user: {
    username: string;
    attributes: {
      email: string;
      name?: string;
    };
  };
}

export const ProjectHeader = ({ user }: ProjectHeaderProps) => {
  const [location] = useLocation();
  
  // Only show project-specific header on project detail pages
  const isProjectPage = location.startsWith('/projects/');
  
  if (isProjectPage) {
    return (
      <header className="h-14 border-b border-border px-6 flex items-center justify-between">
        <h2 className="text-lg font-semibold">Example AWS Training Course</h2>
        <div className="flex items-center space-x-2">
          <Button variant="outline" size="sm">
            Save
          </Button>
          <Button size="sm">
            Build with AI
          </Button>
        </div>
      </header>
    );
  }
  
  return (
    <header className="h-14 border-b border-border px-6 flex items-center justify-between">
      <h2 className="text-lg font-semibold">Dashboard</h2>
      <Button size="sm">
        <PlusCircle className="h-4 w-4 mr-2" />
        New Project
      </Button>
    </header>
  );
};
EOF

cat > src/components/core/AIAssistant.tsx << 'EOF'
import React, { useState } from 'react';
import { X, SendHorizontal } from 'lucide-react';
import { Button } from '../ui/button';
import { Card } from '../ui/card';

interface AIAssistantProps {
  onClose: () => void;
}

export const AIAssistant = ({ onClose }: AIAssistantProps) => {
  const [messages, setMessages] = useState<{role: 'user' | 'assistant', content: string}[]>([
    {
      role: 'assistant',
      content: "Hi there! I'm your AI Assistant for TrainCraft. How can I help you create AWS training content today?"
    }
  ]);
  const [input, setInput] = useState('');
  
  const handleSend = () => {
    if (!input.trim()) return;
    
    // Add user message
    setMessages([...messages, { role: 'user', content: input }]);
    
    // Clear input
    setInput('');
    
    // In a real implementation, we would call Amazon Bedrock here
    // For the prototype, we'll just simulate a response
    setTimeout(() => {
      setMessages(prev => [
        ...prev,
        {
          role: 'assistant',
          content: `I'm simulating a response to: "${input}". In the actual implementation, this would be processed by Amazon Bedrock.`
        }
      ]);
    }, 1000);
  };
  
  return (
    <div className="w-80 h-full bg-card border-l border-border flex flex-col">
      <div className="h-14 flex items-center justify-between px-4 border-b border-border">
        <h3 className="text-sm font-medium">AI Assistant</h3>
        <Button variant="ghost" size="icon" onClick={onClose}>
          <X className="h-4 w-4" />
        </Button>
      </div>
      
      <div className="flex-1 overflow-y-auto p-4 space-y-4">
        {messages.map((message, index) => (
          <Card
            key={index}
            className={`p-3 max-w-[85%] ${
              message.role === 'assistant' 
                ? 'bg-secondary text-secondary-foreground' 
                : 'bg-primary text-primary-foreground ml-auto'
            }`}
          >
            {message.content}
          </Card>
        ))}
      </div>
      
      <div className="p-4 border-t border-border">
        <div className="flex items-center space-x-2">
          <input
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyPress={(e) => e.key === 'Enter' && handleSend()}
            placeholder="Ask me anything..."
            className="flex-1 bg-background border border-input rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-primary"
          />
          <Button size="icon" onClick={handleSend}>
            <SendHorizontal className="h-4 w-4" />
          </Button>
        </div>
      </div>
    </div>
  );
};
EOF

# Create components/pages directory files
mkdir -p src/components/pages
cat > src/components/pages/Dashboard.tsx << 'EOF'
import React from 'react';
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card';
import { Link } from 'wouter';
import { FileText, Clock, CheckCircle, AlertCircle } from 'lucide-react';
import { Button } from '../ui/button';

export const Dashboard = () => {
  // Mock projects for the prototype
  const projects = [
    {
      id: 'example-project',
      title: 'AWS Security Fundamentals',
      courseCode: 'SEC-101',
      status: 'in-progress',
      currentStage: 3,
      updatedAt: '2023-10-15T14:30:00Z'
    },
    {
      id: 'example-project-2',
      title: 'Introduction to Amazon S3',
      courseCode: 'S3-201',
      status: 'not-started',
      currentStage: 1,
      updatedAt: '2023-10-14T10:15:00Z'
    }
  ];
  
  return (
    <div className="space-y-6">
      {/* Dashboard Header */}
      <div>
        <h1 className="text-2xl font-bold tracking-tight">Welcome to TrainCraft AI</h1>
        <p className="text-muted-foreground">
          Build and manage your AWS training content with AI assistance
        </p>
      </div>
      
      {/* Dashboard Statistics */}
      <div className="grid gap-4 md:grid-cols-3">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">
              Total Projects
            </CardTitle>
            <FileText className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">2</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">
              In Progress
            </CardTitle>
            <Clock className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">1</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">
              Completed
            </CardTitle>
            <CheckCircle className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">0</div>
          </CardContent>
        </Card>
      </div>
      
      {/* Projects List */}
      <div>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-xl font-semibold">Your Projects</h2>
          <Button>
            New Project
          </Button>
        </div>
        
        <div className="space-y-4">
          {projects.map(project => (
            <Link key={project.id} href={`/projects/${project.id}`}>
              <a className="block">
                <Card className="hover:border-primary transition-colors">
                  <CardContent className="p-4">
                    <div className="flex items-center justify-between">
                      <div>
                        <h3 className="font-semibold">{project.title}</h3>
                        <p className="text-sm text-muted-foreground">
                          {project.courseCode} | Stage {project.currentStage}
                        </p>
                      </div>
                      <div className="flex items-center">
                        {project.status === 'in-progress' ? (
                          <span className="flex items-center text-sm text-blue-500">
                            <Clock className="h-4 w-4 mr-1" />
                            In Progress
                          </span>
                        ) : project.status === 'completed' ? (
                          <span className="flex items-center text-sm text-green-500">
                            <CheckCircle className="h-4 w-4 mr-1" />
                            Completed
                          </span>
                        ) : (
                          <span className="flex items-center text-sm text-amber-500">
                            <AlertCircle className="h-4 w-4 mr-1" />
                            Not Started
                          </span>
                        )}
                      </div>
                    </div>
                  </CardContent>
                </Card>
              </a>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
};
EOF

cat > src/components/pages/ProjectDetail.tsx << 'EOF'
import React from 'react';
import { useLocation } from 'wouter';
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card';
import { CourseInfoForm } from '../stages/CourseInfoForm';
import { Button } from '../ui/button';
import { CheckCircle } from 'lucide-react';

interface ProjectDetailProps {
  projectId: string;
}

export const ProjectDetail = ({ projectId }: ProjectDetailProps) => {
  // In a real implementation, we would fetch the project details from the API
  // For the prototype, we'll use mock data
  const projectData = {
    id: projectId,
    title: 'AWS Security Fundamentals',
    courseCode: 'SEC-101',
    description: 'A comprehensive course on AWS security best practices',
    targetAudience: 'IT Security Professionals',
    duration: '2 Days',
    version: '1.0',
    instructionalLevel: '200 (Intermediate)',
    audienceSkillLevel: 'Intermediate',
    status: 'in-progress',
    currentStage: 1,
  };
  
  // Workflow stages
  const stages = [
    { id: 1, name: "Course Information", completed: true },
    { id: 2, name: "PRD", completed: false },
    { id: 3, name: "Design Workshop", completed: false },
    { id: 4, name: "DDD", completed: false },
    { id: 5, name: "Content Development", completed: false },
    { id: 6, name: "Lab Design", completed: false },
    { id: 7, name: "Visual Design", completed: false },
    { id: 8, name: "Review", completed: false },
    { id: 9, name: "Publish", completed: false },
  ];
  
  return (
    <div className="space-y-6">
      {/* Workflow Progress */}
      <Card>
        <CardContent className="p-4">
          <div className="flex items-center space-x-2 overflow-x-auto pb-2">
            {stages.map((stage, index) => (
              <React.Fragment key={stage.id}>
                <div className="flex flex-col items-center">
                  <div 
                    className={`w-8 h-8 rounded-full flex items-center justify-center ${
                      projectData.currentStage === stage.id
                        ? 'bg-primary text-primary-foreground'
                        : stage.completed
                        ? 'bg-green-100 text-green-700 dark:bg-green-900 dark:text-green-300'
                        : 'bg-secondary text-secondary-foreground'
                    }`}
                  >
                    {stage.completed ? (
                      <CheckCircle className="h-4 w-4" />
                    ) : (
                      stage.id
                    )}
                  </div>
                  <span className="text-xs mt-1 whitespace-nowrap">{stage.name}</span>
                </div>
                {index < stages.length - 1 && (
                  <div className="w-8 h-0.5 bg-secondary" />
                )}
              </React.Fragment>
            ))}
          </div>
        </CardContent>
      </Card>
      
      {/* Current Stage Content */}
      <CourseInfoForm projectData={projectData} />
      
      {/* Navigation Buttons */}
      <div className="flex justify-between pt-4">
        <Button variant="outline" disabled>
          Previous
        </Button>
        <Button>
          Next Stage
        </Button>
      </div>
    </div>
  );
};
EOF

# Create components/stages directory files
mkdir -p src/components/stages
cat > src/components/stages/CourseInfoForm.tsx << 'EOF'
import React from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import { Card, CardHeader, CardTitle, CardContent, CardFooter } from "../ui/card";
import { Input } from "../ui/input";
import { Textarea } from "../ui/textarea";
import { Button } from "../ui/button";

// Define form schema using Zod
const formSchema = z.object({
  title: z.string().min(3, "Title must be at least 3 characters"),
  courseCode: z.string().min(1, "Course code is required"),
  description: z.string().min(10, "Description must be at least 10 characters"),
  targetAudience: z.string().min(3, "Target audience is required"),
  duration: z.string().min(1, "Duration is required"),
  version: z.string().min(1, "Version is required"),
  instructionalLevel: z.string().min(1, "Instructional level is required"),
  audienceSkillLevel: z.string().min(1, "Audience skill level is required"),
});

type FormValues = z.infer<typeof formSchema>;

interface CourseInfoFormProps {
  projectData: {
    id: string;
    title: string;
    courseCode: string;
    description: string;
    targetAudience: string;
    duration: string;
    version: string;
    instructionalLevel: string;
    audienceSkillLevel: string;
  };
}

export const CourseInfoForm = ({ projectData }: CourseInfoFormProps) => {
  const { register, handleSubmit, formState: { errors } } = useForm<FormValues>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      title: projectData.title,
      courseCode: projectData.courseCode,
      description: projectData.description,
      targetAudience: projectData.targetAudience,
      duration: projectData.duration,
      version: projectData.version,
      instructionalLevel: projectData.instructionalLevel,
      audienceSkillLevel: projectData.audienceSkillLevel,
    }
  });
  
  const onSubmit = (data: FormValues) => {
    console.log("Form submitted:", data);
    // Here we would update the project data via API
  };
  
  return (
    <Card>
      <CardHeader>
        <CardTitle>Course Information</CardTitle>
      </CardHeader>
      <form onSubmit={handleSubmit(onSubmit)}>
        <CardContent className="space-y-4">
          {/* Title */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="space-y-2">
              <label htmlFor="title" className="text-sm font-medium">
                Course Title
              </label>
              <Input 
                id="title" 
                {...register("title")} 
                placeholder="Enter course title"
              />
              {errors.title && (
                <p className="text-sm text-destructive">{errors.title.message}</p>
              )}
            </div>
            
            {/* Course Code */}
            <div className="space-y-2">
              <label htmlFor="courseCode" className="text-sm font-medium">
                Course Code
              </label>
              <Input 
                id="courseCode" 
                {...register("courseCode")} 
                placeholder="E.g., AWS-101"
              />
              {errors.courseCode && (
                <p className="text-sm text-destructive">{errors.courseCode.message}</p>
              )}
            </div>
          </div>
          
          {/* Description */}
          <div className="space-y-2">
            <label htmlFor="description" className="text-sm font-medium">
              Description
            </label>
            <Textarea 
              id="description" 
              {...register("description")} 
              placeholder="Enter course description"
              rows={4}
            />
            {errors.description && (
              <p className="text-sm text-destructive">{errors.description.message}</p>
            )}
          </div>
          
          {/* Target Audience */}
          <div className="space-y-2">
            <label htmlFor="targetAudience" className="text-sm font-medium">
              Target Audience
            </label>
            <Input 
              id="targetAudience" 
              {...register("targetAudience")} 
              placeholder="Who is this course for?"
            />
            {errors.targetAudience && (
              <p className="text-sm text-destructive">{errors.targetAudience.message}</p>
            )}
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {/* Duration */}
            <div className="space-y-2">
              <label htmlFor="duration" className="text-sm font-medium">
                Duration
              </label>
              <Input 
                id="duration" 
                {...register("duration")} 
                placeholder="E.g., 2 Days"
              />
              {errors.duration && (
                <p className="text-sm text-destructive">{errors.duration.message}</p>
              )}
            </div>
            
            {/* Version */}
            <div className="space-y-2">
              <label htmlFor="version" className="text-sm font-medium">
                Version
              </label>
              <Input 
                id="version" 
                {...register("version")} 
                placeholder="E.g., 1.0"
              />
              {errors.version && (
                <p className="text-sm text-destructive">{errors.version.message}</p>
              )}
            </div>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {/* Instructional Level */}
            <div className="space-y-2">
              <label htmlFor="instructionalLevel" className="text-sm font-medium">
                Instructional Level
              </label>
              <Input 
                id="instructionalLevel" 
                {...register("instructionalLevel")} 
                placeholder="E.g., 200 (Intermediate)"
              />
              {errors.instructionalLevel && (
                <p className="text-sm text-destructive">{errors.instructionalLevel.message}</p>
              )}
            </div>
            
            {/* Audience Skill Level */}
            <div className="space-y-2">
              <label htmlFor="audienceSkillLevel" className="text-sm font-medium">
                Audience Skill Level
              </label>
              <Input 
                id="audienceSkillLevel" 
                {...register("audienceSkillLevel")} 
                placeholder="E.g., Intermediate"
              />
              {errors.audienceSkillLevel && (
                <p className="text-sm text-destructive">{errors.audienceSkillLevel.message}</p>
              )}
            </div>
          </div>
        </CardContent>
        <CardFooter className="flex justify-between">
          <Button type="button" variant="outline">
            Cancel
          </Button>
          <Button type="submit">
            Save
          </Button>
        </CardFooter>
      </form>
    </Card>
  );
};
EOF

# Create components/ui directory files
mkdir -p src/components/ui
cat > src/components/ui/button.tsx << 'EOF'
import * as React from "react"
import { Slot } from "@radix-ui/react-slot"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "../../lib/utils"

const buttonVariants = cva(
  "inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        destructive:
          "bg-destructive text-destructive-foreground hover:bg-destructive/90",
        outline:
          "border border-input hover:bg-accent hover:text-accent-foreground",
        secondary:
          "bg-secondary text-secondary-foreground hover:bg-secondary/80",
        ghost: "hover:bg-accent hover:text-accent-foreground",
        link: "underline-offset-4 hover:underline text-primary",
      },
      size: {
        default: "h-10 px-4 py-2",
        sm: "h-9 rounded-md px-3",
        lg: "h-11 rounded-md px-8",
        icon: "h-10 w-10",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  }
)

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, ...props }, ref) => {
    const Comp = asChild ? Slot : "button"
    return (
      <Comp
        className={cn(buttonVariants({ variant, size, className }))}
        ref={ref}
        {...props}
      />
    )
  }
)
Button.displayName = "Button"

export { Button, buttonVariants }
EOF

cat > src/components/ui/card.tsx << 'EOF'
import * as React from "react"

import { cn } from "../../lib/utils"

const Card = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn(
      "rounded-lg border bg-card text-card-foreground shadow-sm",
      className
    )}
    {...props}
  />
))
Card.displayName = "Card"

const CardHeader = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex flex-col space-y-1.5 p-6", className)}
    {...props}
  />
))
CardHeader.displayName = "CardHeader"

const CardTitle = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLHeadingElement>
>(({ className, ...props }, ref) => (
  <h3
    ref={ref}
    className={cn(
      "text-lg font-semibold leading-none tracking-tight",
      className
    )}
    {...props}
  />
))
CardTitle.displayName = "CardTitle"

const CardDescription = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, ...props }, ref) => (
  <p
    ref={ref}
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
))
CardDescription.displayName = "CardDescription"

const CardContent = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div ref={ref} className={cn("p-6 pt-0", className)} {...props} />
))
CardContent.displayName = "CardContent"

const CardFooter = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex items-center p-6 pt-0", className)}
    {...props}
  />
))
CardFooter.displayName = "CardFooter"

export { Card, CardHeader, CardFooter, CardTitle, CardDescription, CardContent }
EOF

cat > src/components/ui/input.tsx << 'EOF'
import * as React from "react"

import { cn } from "../../lib/utils"

export interface InputProps
  extends React.InputHTMLAttributes<HTMLInputElement> {}

const Input = React.forwardRef<HTMLInputElement, InputProps>(
  ({ className, type, ...props }, ref) => {
    return (
      <input
        type={type}
        className={cn(
          "flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
          className
        )}
        ref={ref}
        {...props}
      />
    )
  }
)
Input.displayName = "Input"

export { Input }
EOF

cat > src/components/ui/textarea.tsx << 'EOF'
import * as React from "react"

import { cn } from "../../lib/utils"

export interface TextareaProps
  extends React.TextareaHTMLAttributes<HTMLTextAreaElement> {}

const Textarea = React.forwardRef<HTMLTextAreaElement, TextareaProps>(
  ({ className, ...props }, ref) => {
    return (
      <textarea
        className={cn(
          "flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
          className
        )}
        ref={ref}
        {...props}
      />
    )
  }
)
Textarea.displayName = "Textarea"

export { Textarea }
EOF

# Create aws-exports.js (empty placeholder for now)
cat > src/aws-exports.js << 'EOF'
// This file will be replaced by the actual configuration when you run 'amplify push'
const awsmobile = {
  // Empty placeholder
};

export default awsmobile;
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

node_modules
dist
dist-ssr
*.local

# Editor directories and files
.vscode/*
!.vscode/extensions.json
.idea
.DS_Store
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# AWS Amplify
aws-exports.js
.amplify
amplifyconfiguration*
EOF

# Create amplify.yml
cat > amplify.yml << 'EOF'
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm ci
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: dist
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
EOF

echo "TrainCraft AI project files created successfully!"

