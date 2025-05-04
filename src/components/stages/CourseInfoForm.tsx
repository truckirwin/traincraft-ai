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
