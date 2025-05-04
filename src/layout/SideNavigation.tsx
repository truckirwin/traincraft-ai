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
