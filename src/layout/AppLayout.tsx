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
