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
