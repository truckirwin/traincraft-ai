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
