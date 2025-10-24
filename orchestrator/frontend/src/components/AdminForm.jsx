import { useState } from 'react';
import { Form, Input, Button, Space, Typography, Alert } from 'antd';
import { UserOutlined, MailOutlined, LockOutlined } from '@ant-design/icons';

const { Title, Text } = Typography;

function AdminForm({ onComplete, onBack }) {
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleSubmit = async (values) => {
    setLoading(true);
    setError(null);
    
    try {
      // Validate password strength
      if (values.password !== values.confirmPassword) {
        throw new Error('Passwords do not match');
      }

      onComplete({
        username: values.username,
        email: values.email,
        password: values.password
      });
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <Title level={3}>Create Admin Account</Title>
      <Text type="secondary">This will be your primary login for the supOS platform</Text>

      {error && (
        <Alert
          message="Validation Error"
          description={error}
          type="error"
          closable
          onClose={() => setError(null)}
          style={{ margin: '20px 0' }}
        />
      )}

      <Form
        form={form}
        layout="vertical"
        onFinish={handleSubmit}
        style={{ marginTop: 30, maxWidth: 500 }}
      >
        <Form.Item
          label="Username"
          name="username"
          rules={[
            { required: true, message: 'Username is required' },
            { min: 3, message: 'Username must be at least 3 characters' },
            { max: 20, message: 'Username cannot exceed 20 characters' },
            { pattern: /^[a-zA-Z0-9_]+$/, message: 'Only letters, numbers, and underscore allowed' }
          ]}
        >
          <Input 
            prefix={<UserOutlined />} 
            placeholder="admin"
            size="large"
          />
        </Form.Item>

        <Form.Item
          label="Email"
          name="email"
          rules={[
            { required: true, message: 'Email is required' },
            { type: 'email', message: 'Invalid email format' }
          ]}
        >
          <Input 
            prefix={<MailOutlined />} 
            placeholder="admin@company.com"
            size="large"
          />
        </Form.Item>

        <Form.Item
          label="Password"
          name="password"
          rules={[
            { required: true, message: 'Password is required' },
            { min: 8, message: 'Password must be at least 8 characters' },
            { pattern: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/, message: 'Must contain uppercase, lowercase, and number' }
          ]}
        >
          <Input.Password 
            prefix={<LockOutlined />} 
            placeholder="Strong password"
            size="large"
          />
        </Form.Item>

        <Form.Item
          label="Confirm Password"
          name="confirmPassword"
          dependencies={['password']}
          rules={[
            { required: true, message: 'Please confirm password' },
            ({ getFieldValue }) => ({
              validator(_, value) {
                if (!value || getFieldValue('password') === value) {
                  return Promise.resolve();
                }
                return Promise.reject(new Error('Passwords do not match'));
              },
            }),
          ]}
        >
          <Input.Password 
            prefix={<LockOutlined />} 
            placeholder="Confirm password"
            size="large"
          />
        </Form.Item>

        <Form.Item style={{ marginTop: 40 }}>
          <Space>
            <Button onClick={onBack}>
              Back
            </Button>
            <Button type="primary" htmlType="submit" loading={loading} size="large">
              Continue
            </Button>
          </Space>
        </Form.Item>
      </Form>
    </div>
  );
}

export default AdminForm;