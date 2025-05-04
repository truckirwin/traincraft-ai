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
