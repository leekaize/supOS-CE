import { useState, useEffect } from 'react';
import { Button, Space, Typography, Card, Checkbox, Row, Col, Alert } from 'antd';
import { AppstoreOutlined } from '@ant-design/icons';
import axios from 'axios';

const { Title, Text, Paragraph } = Typography;

import { API_BASE } from '../config';

function AppSelection({ selectedApps, onComplete, onBack }) {
  const [apps, setApps] = useState([]);
  const [selected, setSelected] = useState(selectedApps || []);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchApps();
  }, []);

  const fetchApps = async () => {
    try {
      const response = await axios.get(`${API_BASE}/apps/list`);
      setApps(response.data.apps || []);
    } catch (error) {
      console.error('Failed to fetch apps:', error);
      // Fallback apps if API fails
      setApps([
        { id: 'grafana', name: 'Grafana', description: 'Metrics visualization and dashboards', icon: '📊' },
        { id: 'minio', name: 'MinIO', description: 'Object storage (S3 compatible)', icon: '🗄️' },
        { id: 'portainer', name: 'Portainer', description: 'Docker container management', icon: '🐳' },
        { id: 'chat2db', name: 'Chat2DB', description: 'Database client with AI', icon: '💬' }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const handleToggle = (appId) => {
    setSelected(prev => 
      prev.includes(appId) 
        ? prev.filter(id => id !== appId)
        : [...prev, appId]
    );
  };

  const handleContinue = () => {
    onComplete(selected);
  };

  return (
    <div>
      <Title level={3}>Select Optional Apps</Title>
      <Text type="secondary">
        Choose additional services to install alongside supOS platform
      </Text>

      <Alert
        message="Core services will be installed automatically"
        description="PostgreSQL, Keycloak, EMQX, Kong, Backend, Frontend, and Node-RED are always included"
        type="info"
        showIcon
        style={{ margin: '20px 0' }}
      />

      <Row gutter={[16, 16]} style={{ marginTop: 30 }}>
        {apps.map(app => (
          <Col xs={24} sm={12} key={app.id}>
            <Card
              hoverable
              onClick={() => handleToggle(app.id)}
              style={{
                border: selected.includes(app.id) ? '2px solid #1890ff' : '1px solid #d9d9d9',
                cursor: 'pointer'
              }}
            >
              <Space direction="vertical" style={{ width: '100%' }}>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                  <Space>
                    <span style={{ fontSize: 24 }}>{app.icon}</span>
                    <Text strong style={{ fontSize: 16 }}>{app.name}</Text>
                  </Space>
                  <Checkbox checked={selected.includes(app.id)} />
                </div>
                <Paragraph type="secondary" style={{ margin: 0 }}>
                  {app.description}
                </Paragraph>
              </Space>
            </Card>
          </Col>
        ))}
      </Row>

      {selected.length > 0 && (
        <Alert
          message={`${selected.length} optional app${selected.length > 1 ? 's' : ''} selected`}
          type="success"
          showIcon
          style={{ margin: '20px 0' }}
        />
      )}

      <div style={{ marginTop: 40 }}>
        <Space>
          <Button onClick={onBack}>
            Back
          </Button>
          <Button type="primary" onClick={handleContinue} size="large">
            Continue
          </Button>
          {selected.length === 0 && (
            <Text type="secondary" style={{ marginLeft: 10 }}>
              (Skip optional apps)
            </Text>
          )}
        </Space>
      </div>
    </div>
  );
}

export default AppSelection;