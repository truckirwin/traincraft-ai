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
