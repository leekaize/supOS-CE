import { useState, useEffect } from 'react';
import { Button, Typography, Steps, Alert, Spin, Progress } from 'antd';
import { CheckCircleOutlined, LoadingOutlined, CloseCircleOutlined } from '@ant-design/icons';
import axios from 'axios';

const { Title, Text, Paragraph } = Typography;

import { API_BASE } from '../config';

const installSteps = [
  { key: 'volumes', title: 'Initialize Volumes' },
  { key: 'containers', title: 'Start Services' },
  { key: 'postinit', title: 'Configure Services' }
];

function Installation({ adminData, selectedApps, onComplete, onBack }) {
  const [currentStep, setCurrentStep] = useState(0);
  const [status, setStatus] = useState('running');
  const [progress, setProgress] = useState(0);
  const [logs, setLogs] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    startInstallation();
  }, []);

  const addLog = (message, type = 'info') => {
    setLogs(prev => [...prev, { message, type, timestamp: new Date().toISOString() }]);
  };

  const startInstallation = async () => {
    try {
      // Step 1: Save configuration & start installation
      addLog('Starting installation...');
      setProgress(10);
      
      const installResponse = await axios.post(`${API_BASE}/install/start`, {
        selected_apps: selectedApps,
        admin: adminData  // Pass admin credentials
      });

      if (!installResponse.data.success) {
        throw new Error(installResponse.data.error || 'Installation failed');
      }

      addLog('✓ Containers started successfully', 'success');
      setCurrentStep(1);
      setProgress(50);

      // Step 2: Wait for Keycloak to be ready
      addLog('Waiting for Keycloak to initialize (60s)...');
      await new Promise(resolve => setTimeout(resolve, 60000));

      setCurrentStep(2);
      setProgress(70);

      // Step 3: Create Keycloak admin
      // addLog('Creating Keycloak admin user...');
      
      // const keycloakResponse = await axios.post(`${API_BASE}/keycloak/create-admin`, {
      //   username: adminData.username,
      //   password: adminData.password,
      //   email: adminData.email
      // });

      // if (!keycloakResponse.data.success) {
      //   // Non-fatal - containers are running
      //   addLog(`⚠ Keycloak admin creation failed: ${keycloakResponse.data.error}`, 'warning');
      //   addLog('You can login with default credentials: supos/supos');
      // } else {
      //   addLog(`✓ Admin user created: ${adminData.username}`, 'success');
      // }

      setCurrentStep(3);
      setProgress(90);

      // Step 4: Verify health
      addLog('Verifying service health...');
      await monitorContainers();

      addLog('✓ Installation complete!', 'success');
      setProgress(100);
      setStatus('success');
      
      setTimeout(() => {
        onComplete();
      }, 2000);

    } catch (err) {
      setStatus('error');
      setError(err.message);
      addLog(`✗ Error: ${err.message}`, 'error');
    }
  };

  const monitorContainers = async () => {
    let attempts = 0;
    const maxAttempts = 30;

    while (attempts < maxAttempts) {
      try {
        const response = await axios.get(`${API_BASE}/install/status`);
        const containers = response.data.containers || [];
        
        const running = containers.filter(c => c.status.includes('running')).length;
        const total = containers.length;
        
        if (running > 0) {
          setProgress(70 + (running / total) * 25);
          addLog(`${running}/${total} containers running`);
        }

        if (running === total && total > 0) {
          return;
        }

        await new Promise(resolve => setTimeout(resolve, 3000));
        attempts++;
      } catch (err) {
        console.error('Monitor error:', err);
        attempts++;
      }
    }

    throw new Error('Container startup timeout');
  };

  return (
    <div>
      <Title level={3}>Installing supOS Platform</Title>
      <Text type="secondary">This may take 3-5 minutes</Text>

      <Steps
        current={currentStep}
        status={status === 'error' ? 'error' : 'process'}
        items={installSteps}
        style={{ margin: '30px 0' }}
      />

      <Progress 
        percent={Math.round(progress)} 
        status={status === 'error' ? 'exception' : status === 'success' ? 'success' : 'active'}
        style={{ marginBottom: 20 }}
      />

      {error && (
        <Alert
          message="Installation Failed"
          description={error}
          type="error"
          showIcon
          icon={<CloseCircleOutlined />}
          style={{ marginBottom: 20 }}
        />
      )}

      <div style={{ 
        background: '#000', 
        color: '#0f0', 
        padding: 20, 
        borderRadius: 4,
        fontFamily: 'monospace',
        fontSize: 13,
        maxHeight: 300,
        overflowY: 'auto'
      }}>
        {logs.map((log, idx) => (
          <div key={idx} style={{ 
            color: log.type === 'error' ? '#f00' : log.type === 'success' ? '#0f0' : '#fff',
            marginBottom: 4
          }}>
            [{new Date(log.timestamp).toLocaleTimeString()}] {log.message}
          </div>
        ))}
        {status === 'running' && (
          <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
            <Spin indicator={<LoadingOutlined style={{ color: '#0f0' }} spin />} />
            <span>Processing...</span>
          </div>
        )}
      </div>

      {status === 'error' && (
        <div style={{ marginTop: 20 }}>
          <Button onClick={onBack}>Back to Configuration</Button>
        </div>
      )}
    </div>
  );
}

export default Installation;