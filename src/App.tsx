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
