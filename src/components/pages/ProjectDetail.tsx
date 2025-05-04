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
