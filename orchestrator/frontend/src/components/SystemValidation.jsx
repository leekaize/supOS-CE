import { useState, useEffect } from 'react';
import { Button, Alert, Spin, List, Typography, Form, Input, Select, Space, Card } from 'antd';
import { CheckCircleOutlined, CloseCircleOutlined, WarningOutlined, SettingOutlined } from '@ant-design/icons';
import axios from 'axios';

const { Title, Text } = Typography;
const { Option } = Select;

import { API_BASE } from '../config';

function SystemValidation({ onComplete }) {
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const [validationResult, setValidationResult] = useState(null);
  const [configSaved, setConfigSaved] = useState(false);

  useEffect(() => {
    runValidation();
    loadDefaultConfig();
  }, []);

  const loadDefaultConfig = async () => {
    try {
      // Get current volumes path
      const response = await axios.get(`${API_BASE}/config/volumes-path`);
      if (response.data.path) {
        form.setFieldsValue({
          volumes_path: response.data.path,
          ip_address: '127.0.0.1',
          resource_spec: '1'
        });
      }
    } catch (error) {
      console.error('Failed to load config:', error);
    }
  };

  const runValidation = async () => {
    setLoading(true);
    try {
      const response = await axios.post(`${API_BASE}/setup/validate`);
      setValidationResult(response.data);
    } catch (error) {
      setValidationResult({
        valid: false,
        issues: [`API Error: ${error.message}`],
        warnings: []
      });
    } finally {
      setLoading(false);
    }
  };

  const handleSubmit = async (values) => {
    setLoading(true);
    try {
      // Save configuration to .env
      const response = await axios.post(`${API_BASE}/config/update`, {
        ip_address: values.ip_address,
        volumes_path: values.volumes_path,
        resource_spec: values.resource_spec
      });

      if (response.data.success) {
        setConfigSaved(true);
        setTimeout(() => onComplete(true), 1000);
      } else {
        throw new Error(response.data.error || 'Failed to save configuration');
      }
    } catch (error) {
      alert(`Configuration save failed: ${error.message}`);
    } finally {
      setLoading(false);
    }
  };

  if (loading && !validationResult) {
    return (
      <div style={{ textAlign: 'center', padding: '60px 0' }}>
        <Spin size="large" />
        <Title level={4} style={{ marginTop: 20 }}>Validating system...</Title>
      </div>
    );
  }

  return (
    <div>
      <Title level={3}>System Configuration</Title>
      <Text type="secondary">Validate requirements and configure platform settings</Text>

      {/* Validation Results */}
      {validationResult && (
        <>
          {validationResult.valid && (
            <Alert
              message="System checks passed"
              description="Your system meets all requirements"
              type="success"
              icon={<CheckCircleOutlined />}
              showIcon
              style={{ margin: '20px 0' }}
            />
          )}

          {validationResult.issues && validationResult.issues.length > 0 && (
            <Alert
              message="Requirements not met"
              description={
                <List
                  size="small"
                  dataSource={validationResult.issues}
                  renderItem={(item) => (
                    <List.Item>
                      <CloseCircleOutlined style={{ color: '#ff4d4f', marginRight: 8 }} />
                      {item}
                    </List.Item>
                  )}
                />
              }
              type="error"
              showIcon
              style={{ margin: '20px 0' }}
            />
          )}

          {validationResult.warnings && validationResult.warnings.length > 0 && (
            <Alert
              message="Warnings"
              description={
                <List
                  size="small"
                  dataSource={validationResult.warnings}
                  renderItem={(item) => (
                    <List.Item>
                      <WarningOutlined style={{ color: '#faad14', marginRight: 8 }} />
                      {item}
                    </List.Item>
                  )}
                />
              }
              type="warning"
              showIcon
              style={{ margin: '20px 0' }}
            />
          )}
        </>
      )}

      {/* Configuration Form */}
      <Card 
        title={
          <Space>
            <SettingOutlined />
            <span>Platform Configuration</span>
          </Space>
        }
        style={{ marginTop: 30 }}
      >
        <Form
          form={form}
          layout="vertical"
          onFinish={handleSubmit}
        >
          <Form.Item
            label="IP Address / Domain"
            name="ip_address"
            rules={[{ required: true, message: 'IP address is required' }]}
            extra="Use 127.0.0.1 for local dev, or your server's IP/domain for production"
          >
            <Input placeholder="127.0.0.1" size="large" />
          </Form.Item>

          <Form.Item
            label="Data Volumes Path"
            name="volumes_path"
            rules={[{ required: true, message: 'Volumes path is required' }]}
            extra="Directory where all supOS data will be stored (requires 20GB+ free space)"
          >
            <Input placeholder="/volumes/supos/data" size="large" />
          </Form.Item>

          <Form.Item
            label="Resource Specification"
            name="resource_spec"
            rules={[{ required: true, message: 'Resource spec is required' }]}
            extra="Choose based on your server capacity"
          >
            <Select size="large">
              <Option value="1">4 CPU / 8GB RAM (Minimum)</Option>
              <Option value="2">8 CPU / 16GB RAM (Recommended)</Option>
            </Select>
          </Form.Item>

          <Form.Item style={{ marginTop: 30 }}>
            <Space>
              {!validationResult?.valid && (
                <Button onClick={runValidation}>
                  Retry Validation
                </Button>
              )}
              <Button 
                type="primary" 
                htmlType="submit" 
                loading={loading}
                disabled={!validationResult?.valid}
                size="large"
              >
                {configSaved ? 'Configuration Saved!' : 'Save & Continue'}
              </Button>
            </Space>
          </Form.Item>
        </Form>
      </Card>
    </div>
  );
}

export default SystemValidation;